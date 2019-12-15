import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/view/text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/widgets.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomDailyHeader extends RefreshIndicator {
  @override
  State<StatefulWidget> createState() {
    return _CustomHeaderState();
  }

  CustomDailyHeader({
    double height: 100.0,
  }) : super(height: height);
}

class _CustomHeaderState extends RefreshIndicatorState<CustomDailyHeader>
    with TickerProviderStateMixin {
  AnimationController _translateController;
  AnimationController _rotateController;
  Animation<Offset> refreshAnimation;
  CurvedAnimation curve;
  AnimationStatusListener listener;

  @override
  void initState() {
    _translateController = AnimationController(
        vsync: this, duration: const Duration(seconds: 500));
    _rotateController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    listener = (status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        //重置起点
        _rotateController.reset();
        //开启
        _rotateController.forward();
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
      } else if (status == AnimationStatus.forward) {
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
      }
    };
    _rotateController.addStatusListener(listener);

    curve = CurvedAnimation(
        parent: _translateController, curve: Curves.fastOutSlowIn);
    refreshAnimation = Tween(begin: Offset(0, 2), end: Offset(0, 0))
        .animate(_translateController);
    super.initState();
  }

  @override
  void dispose() {
    if (_rotateController != null) {
      _rotateController.stop();
      _rotateController.removeStatusListener(listener);
      _rotateController.dispose();
    }
    if (_translateController != null) {
      _translateController.stop();
      _translateController.dispose();
    }

    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context, RefreshStatus mode) {
    final Widget content = Stack(
      children: <Widget>[
        Image.asset(
          AppTheme.getInstance().dark
              ? 'assets/header_bg_night.png'
              : 'assets/header_fg_day.png',
          fit: prefix0.BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.only(left: 75),
          child: buildHeadWidget(mode),
        ),
      ],
    );
    return content;
  }

  Widget buildHeadWidget(RefreshStatus mode) {
    if (mode == RefreshStatus.completed && _rotateController.isAnimating) {
      _rotateController.stop();
    }
    final Widget rotateWidget = RotationTransition(
      turns: mode == RefreshStatus.refreshing ? _rotateController : curve,
      //设置动画的旋转中心
      alignment: Alignment.center,
      child: Image.asset(
        'assets/sun.png',
        height: 30,
        width: 30,
      ),
    );
    final Widget translateWidget = SlideTransition(
      position: refreshAnimation,
      child: rotateWidget,
    );
    if (mode == RefreshStatus.refreshing)
      _rotateController.forward();
    else {
      _rotateController.stop();
      _translateController.reverse();
    }
    return mode == RefreshStatus.refreshing ? rotateWidget : translateWidget;
  }

  @override
  void onOffsetChange(double offset) {
    super.onOffsetChange(offset);
    if (!floating) {
      _translateController.value =
          (offset / configuration.headerTriggerDistance) * 0.6;
    }
  }
}

class CustomDailyFooter extends LoadIndicator {
  final FootDirection footDirection;
  final double height;

  CustomDailyFooter(
      {this.height = 100,
      this.footDirection = FootDirection.Horizontal,
      LoadStyle loadStyle: LoadStyle.ShowAlways})
      : super(height: height, loadStyle: loadStyle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomDailyFooterState();
  }
}

class _CustomDailyFooterState extends LoadIndicatorState<CustomDailyFooter>
    with TickerProviderStateMixin {
  AnimationController _scaleController1;
  AnimationController _scaleController2;
  AnimationController _scaleController3;
  AnimationStatusListener listener1;
  AnimationStatusListener listener2;
  AnimationStatusListener listener3;

  @override
  void dispose() {
    if (_scaleController1.isAnimating) {
      _scaleController1.stop();
      _scaleController1.removeStatusListener(listener1);
      _scaleController1.dispose();
    }
    if (_scaleController2.isAnimating) {
      _scaleController2.stop();
      _scaleController2.removeStatusListener(listener2);
      _scaleController2.dispose();
    }
    if (_scaleController3.isAnimating) {
      _scaleController3.stop();
      _scaleController3.removeStatusListener(listener3);
      _scaleController3.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scaleController1 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _scaleController2 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _scaleController3 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    listener1 = (status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        _scaleController1.repeat(reverse: true);
      }
    };
    listener2 = (status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        _scaleController2.repeat(reverse: true);
      }
    };
    listener3 = (status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        //开启
        _scaleController3.repeat(reverse: true);
      }
    };
    _scaleController1.addStatusListener(listener1);
    _scaleController2.addStatusListener(listener2);
    _scaleController3.addStatusListener(listener3);
    _scaleController1.repeat(reverse: true);
    _scaleController2.repeat(reverse: true);
    _scaleController3.repeat(reverse: true);
  }

  @override
  Widget buildContent(BuildContext context, LoadStatus mode) {
    // TODO: implement buildContent
    if (mode == LoadStatus.idle) {
      return prefix0.SizedBox();
    } else if (mode == LoadStatus.noMore) {
      return prefix0.Container(
        margin: prefix0.EdgeInsets.only(left: 100, right: 100, top: 20),
        child: prefix0.Row(
          children: <Widget>[
            prefix0.Expanded(
              flex: 1,
              child: prefix0.Container(
                height: 0.2,
                color: AppTheme.getInstance().unSelectTextColor,
              ),
            ),
            prefix0.SizedBox(
              width: 10,
            ),
            SubTitleText(
              '沒有更多啦',
              color: AppTheme.getInstance().unSelectTextColor,
            ),
            prefix0.SizedBox(
              width: 10,
            ),
            prefix0.Expanded(
              flex: 1,
              child: prefix0.Container(
                height: 0.2,
                color: AppTheme.getInstance().unSelectTextColor,
              ),
            ),
          ],
        ),
      );
    }
    final Widget dotWidget1 = ScaleTransition(
      scale: _scaleController1,
      child: prefix0.Image.asset(
        'assets/icon_yellow_oval.png',
        width: 15,
        height: 15,
      ),
    );
    final Widget dotWidget2 = ScaleTransition(
      scale: _scaleController2,
      child: prefix0.Image.asset(
        'assets/icon_yellow_oval.png',
        width: 15,
        height: 15,
      ),
    );
    final Widget dotWidget3 = ScaleTransition(
      scale: _scaleController3,
      child: prefix0.Image.asset(
        'assets/icon_yellow_oval.png',
        width: 15,
        height: 15,
      ),
    );
    final prefix0.Widget body = prefix0.Container(
      height: widget.footDirection == FootDirection.Horizontal ? 50 : 100,
      child: widget.footDirection == FootDirection.Horizontal
          ? prefix0.Row(
              mainAxisAlignment: prefix0.MainAxisAlignment.center,
              crossAxisAlignment: prefix0.CrossAxisAlignment.center,
              children: <Widget>[
                dotWidget1,
                prefix0.SizedBox(
                  width: 10,
                ),
                dotWidget2,
                prefix0.SizedBox(
                  width: 10,
                ),
                dotWidget3,
              ],
            )
          : prefix0.Container(
              width: 50,
              child: prefix0.Column(
                mainAxisAlignment: prefix0.MainAxisAlignment.center,
                crossAxisAlignment: prefix0.CrossAxisAlignment.center,
                children: <Widget>[
                  dotWidget1,
                  prefix0.SizedBox(
                    width: 10,
                  ),
                  dotWidget2,
                  prefix0.SizedBox(
                    width: 10,
                  ),
                  dotWidget3,
                ],
              ),
            ),
    );
    if (mode == LoadStatus.loading) {
      _scaleController1.forward();
      Future.delayed(Duration(milliseconds: 1000), () {
        _scaleController2.forward();
      });
      Future.delayed(Duration(milliseconds: 1200), () {
        _scaleController3.forward();
      });
    }
    return body;
  }
}

//class CustomDailyFooter extends prefix0.StatefulWidget {
//  final FootDirection footDirection;
//  final double height;
//
//  CustomDailyFooter({
//    this.height = 100,
//    this.footDirection = FootDirection.Horizontal,
//  });
//
//  @override
//  State<StatefulWidget> createState() {
//    return _CustomDailyFooterState();
//  }
//}
//
//class _CustomDailyFooterState extends State<CustomDailyFooter>
//    with TickerProviderStateMixin {
//  GifController _gifController;
//
//  @override
//  void initState() {
//    super.initState();
//    _gifController = new GifController(vsync: this, value: 1);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return CustomFooter(
//      loadStyle: LoadStyle.ShowWhenLoading,
//      onModeChange: (mode) {
//        if (mode == LoadStatus.loading) {
//          _gifController.repeat(
//              min: 0, max: 20, period: Duration(milliseconds: 2000));
//        }
//      },
//      endLoading: () async {
//        _gifController.value = 20;
//        return _gifController.animateTo(20,
//            duration: Duration(milliseconds: 2000));
//      },
//      builder: (context, mode) {
//        return prefix0.Container(
//          height: widget.height,
//          padding: prefix0.EdgeInsets.only(bottom:20),
//          child: prefix0.Center(
//            child: GifImage(
//              controller: _gifController,
//              image: AssetImage('assets/icon_loadmore.gif'),
//              height: 120,
//              width: 200,
//            ),
//          ),
//        );
//      },
//    );
//  }
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    _gifController.dispose();
//    super.dispose();
//  }
//}
enum FootDirection { Horizontal, Vertical }
