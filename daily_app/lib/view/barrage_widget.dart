import 'dart:math';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart';

typedef ItemWidgetBuilder = Widget Function(BuildContext context, int index);
typedef ItemTextLength = int Function(BuildContext context, int index);
typedef OnLoadMore = Widget Function();

///弹幕控件
class BarrageWidget extends StatefulWidget {
  ///弹幕控制器

  ///集合数量
  final int itemCount;

  ///弹幕构建器
  final ItemWidgetBuilder builder;

  ///弹幕长度
  final ItemTextLength itemTextLength;

  ///弹幕加载更多
  final OnLoadMore loadMore;

  ///弹道数量
  final int barrageCount;
  final double barrageWidth;

  BarrageWidget(
      {this.itemCount = 0,
      this.builder,
      this.barrageCount = 6,
      this.loadMore,
      this.barrageWidth = 200.0,
      this.itemTextLength});

  @override
  State<StatefulWidget> createState() {
    return _BarrageWidgetState();
  }
}

class _BarrageWidgetState extends State<BarrageWidget>
    with TickerProviderStateMixin {
  ///缓存控件数据用来获取控件宽度
  List<Widget> cacheWidgets = new List();
  List<Widget> currentWidgets = new List();
  List<AnimationController> controllers = new List();

  ///当前数据索引
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    currentWidgets.clear();
    var width = MediaQuery.of(context).size.width;
    currentWidgets.add(SizedBox(
      width: width,
      height: 250,
    ));
    currentWidgets.add(Positioned(
      left: width,
      child: Column(
        children: cacheWidgets,
      ),
    ));
    return Stack(
      children: currentWidgets,
    );
  }

  @override
  void dispose() {
    if (controllers != null && controllers.length > 0)
      controllers.forEach((controller) {
        controller.dispose();
      });
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((res) {
      _buildCacheWidgets();
      setState(() {});

      ///布局完成后回调这里
      controllers.forEach((controller) {
        Future.delayed(Duration(milliseconds: Random().nextInt(1000)), () {
          controller.forward();
        });
      });
    });
  }

  ///构建缓存数据
  Widget _buildCacheWidgets() {
    cacheWidgets.clear();
    var width = MediaQuery.of(context).size.width;
    controllers.clear();
    int index = 0;
    for (int i = _currentIndex; i < widget.barrageCount; i++) {
      if (_currentIndex < widget.itemCount) {
        cacheWidgets.add(SizedBox(
          height: 10,
        ));
        cacheWidgets.add(_buildNextAnimationWidget(
            widget.builder(context, _currentIndex + i),
            widget.itemTextLength == null
                ? 10
                : widget.itemTextLength(context, _currentIndex + i),
            i));
        index = i;
      } else {
        if (widget.loadMore != null) {
          ///加载更多的数据回调
          widget.loadMore();
        } else {
          ///将索引值置为0，从新开始
          _currentIndex = 0;
        }
      }
    }
    _currentIndex = index;
    return Positioned(
      left: width,
      child: Column(
        children: cacheWidgets,
      ),
    );
  }

  Widget _buildAnimationWidget(Widget widget, int length) {
    ///获取最终移动的offset
    var screenWidth = MediaQuery.of(context).size.width;
    var offset = screenWidth / this.widget.barrageWidth;
    var animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10000));
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    Animation barrageAnimation =
        Tween(begin: Offset(0, 0), end: Offset(-2 * offset, 0)).animate(curve);
    controllers.add(animationController);
    return SizedBox(
      width: length * Random().nextInt(10) + this.widget.barrageWidth,
      child: SlideTransition(
        position: barrageAnimation,
        child: widget,
      ),
    );
  }

  Widget _buildNextAnimationWidget(Widget widget, int length, int index) {
    ///获取最终移动的offset
    var screenWidth = MediaQuery.of(context).size.width;
    var offset = screenWidth / this.widget.barrageWidth;
    var animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10000));
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    Animation barrageAnimation =
        Tween(begin: Offset(0, 0), end: Offset(-2 * offset, 0)).animate(curve);
    controllers.add(animationController);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        println("complete animation");
        _currentIndex++;
        if (_currentIndex >= this.widget.itemCount) {
          this.widget.loadMore();
          return;
        }
        var builderWidget = this.widget.builder(context, _currentIndex);
        var itemTextLength = this.widget.itemTextLength(context, _currentIndex);
        cacheWidgets.insert(index,
            _buildNextAnimationWidget(builderWidget, itemTextLength, index));

        setState(() {
          animationController.forward();
        });
      }
    });
    return SizedBox(
      width: length * Random().nextInt(10) + this.widget.barrageWidth,
      child: SlideTransition(
        position: barrageAnimation,
        child: widget,
      ),
    );
  }

  void _addListener() {
    for (int i = 0; i < controllers.length; i++) {
      controllers[i].addStatusListener((status) {
        if (status == AnimationStatus.completed) {}
      });
    }
  }
}
