import 'dart:io';

import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/view/left_float_action.dart';
import 'package:daily_app/view/loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
 * 会根据平台，去适配所在平台的小部件
 * Flutter中包含了适用于IOS和Android的两套原生小部件，名为Cupertino和Material
 */
abstract class BasePlatformWidget<A extends Widget, I extends Widget>
    extends StatelessWidget {
  A createAndroidWidget(BuildContext context);

  I createIosWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    /**如果是IOS平台，返回ios风格的控件
     * Android和其他平台都返回materil风格的控件
     */
    if (Platform.isIOS) {
      return createIosWidget(context);
    }
    return createAndroidWidget(context);
  }
}

/**
 * 脚手架
 */
class PlatformScaffold extends BasePlatformWidget<Scaffold, Scaffold> {
  PlatformScaffold({
    this.appBar,
    this.bottomNavigationBar,
    this.body,
    this.backgroundColor,
    this.showLoading = false,
    this.floatingActionButton,
  });

  final PreferredSizeWidget appBar;
  final Widget body;
  final Widget bottomNavigationBar;
  final backgroundColor;
  final bool showLoading; //是否显示加载动画
  final Widget floatingActionButton;

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      backgroundColor: backgroundColor == null
          ? AppTheme.getInstance().bodyBackColor
          : backgroundColor,
      appBar: appBar == null ? null : appBar,
      body: showLoading ? LoadingView() : body,
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomPadding: false,
      //输入框抵住键盘 内容不随键盘滚动
      floatingActionButtonLocation: leftFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: floatingActionButton,
    );
  }

  @override
  Scaffold createIosWidget(BuildContext context) {
    return createAndroidWidget(context);
  }
}

/**
 * AppBar
 */
class PlatformAppBar
    extends BasePlatformWidget<AppBar, CupertinoNavigationBar> {
  final Widget title;
  final Widget action;
  final bool centerTitle;
  final Color backArrowColor;
  final Color backgroundColor;
  final bool showLine;
  final TabBar tabBar;
  final Color _kDefaultNavBarBorderColor = Color(0x4C000000);
  final Widget leading;

  PlatformAppBar(
      {this.title,
      this.centerTitle = true,
      this.action,
      this.backArrowColor,
      this.showLine = false,
      this.tabBar,
      this.backgroundColor,
      this.leading});

  @override
  AppBar createAndroidWidget(BuildContext context) {
    return new AppBar(
      title: title,
      centerTitle: centerTitle ?? true,
      actions: action != null ? <Widget>[action] : [],
      elevation: showLine == null ? AppBarTheme.of(context).elevation : 0,
      iconTheme: IconThemeData(
          color: backArrowColor == null ? Colors.black : backArrowColor),
      backgroundColor: backgroundColor == null
          ? AppBarTheme.of(context).color
          : backgroundColor,
      leading: leading,
      bottom: tabBar,
    );
  }

  @override
  CupertinoNavigationBar createIosWidget(BuildContext context) {
    return new CupertinoNavigationBar(
      middle: title,
      trailing: action,
      backgroundColor: backgroundColor == null
          ? AppBarTheme.of(context).color
          : Colors.white,
      border: showLine == null
          ? Border(
              bottom: BorderSide(
                color: _kDefaultNavBarBorderColor,
                width: 0.0, // One physical pixel.
                style: BorderStyle.solid,
              ),
            )
          : null,
      actionsForegroundColor:
          backArrowColor == null ? Colors.black : Colors.white,
      leading: leading,
    );
  }
}

/**
 * 对话框
 */
class PlatformAlertDialog
    extends BasePlatformWidget<AlertDialog, CupertinoAlertDialog> {
  final Widget title;
  final Widget content;
  final List<Widget> actions;

  PlatformAlertDialog({this.title, this.content, this.actions});

  @override
  AlertDialog createAndroidWidget(BuildContext context) {
    return new AlertDialog(
      title: title,
      content: content,
      actions: actions,
    );
  }

  @override
  CupertinoAlertDialog createIosWidget(BuildContext context) {
    return new CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions,
    );
  }
}

/**
 * Switch
 */

class PlatformSwicth extends BasePlatformWidget<Switch, CupertinoSwitch> {
  final bool value;
  final ValueChanged<bool> onChanged;

  PlatformSwicth({this.value, this.onChanged});

  @override
  Switch createAndroidWidget(BuildContext context) {
    return new Switch(value: value, onChanged: onChanged);
  }

  @override
  CupertinoSwitch createIosWidget(BuildContext context) {
    return new CupertinoSwitch(value: value, onChanged: onChanged);
  }
}

/**
 * Button
 */
class PlatformButton
    extends BasePlatformWidget<MaterialButton, CupertinoButton> {
  final VoidCallback onPressed;
  final Widget child;
  final Color disabledColor;
  final ShapeBorder shape;
  final Color color;

  PlatformButton(
      {this.onPressed, this.child, this.disabledColor, this.shape, this.color});

  @override
  MaterialButton createAndroidWidget(BuildContext context) {
    return new MaterialButton(
      height: 50,
      onPressed: onPressed,
      child: child,
      disabledColor: disabledColor,
      color: color,
      shape: shape,
    );
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    return new CupertinoButton(
      child: child,
      onPressed: onPressed,
      disabledColor: disabledColor,
      color: color,
    );
  }
}

/**
 * Button
 */
class PlatformBottomTabBar
    extends BasePlatformWidget<BottomNavigationBar, CupertinoTabBar> {
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;
  final Color fixedColor;
  final Color backgroundColor;

  final int currentIndex;

  @override
  BottomNavigationBar createAndroidWidget(BuildContext context) {
    return new BottomNavigationBar(
      onTap: onTap,
      fixedColor: fixedColor,
      items: items,
      currentIndex: currentIndex,
    );
  }

  PlatformBottomTabBar(
      {this.onTap,
      this.currentIndex,
      this.items,
      this.fixedColor,
      this.backgroundColor});

  @override
  CupertinoTabBar createIosWidget(BuildContext context) {
    return new CupertinoTabBar(
        items: items,
        onTap: onTap,
        backgroundColor: backgroundColor,
        currentIndex: currentIndex,
        activeColor: fixedColor);
  }
}
