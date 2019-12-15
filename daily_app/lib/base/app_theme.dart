import 'dart:io';

import 'package:daily_app/view/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//主题
final ThemeData lightTheme = ThemeData.light();
final ThemeData darkTheme = ThemeData.dark();

class AppTheme {
  bool dark;

  ///文本颜色
  Color textColor;

  ///说明文本颜色
  Color subTextColor;

  ///每个item的背景颜色
  Color backColor;

  ///整个页面的背景颜色
  Color bodyBackColor;
  Color unSelectTextColor;
  TextSize textSize;

  ///主要标题文字的大小
  double mainTextSize;

  ///副标题文字大小
  double subTextSize;

  ///小文字大小
  double smallTextSize;

  AppTheme._(bool dark, {TextSize textSize}) {
    _init(dark, textSize: textSize);
  }

  static AppTheme _instance;

  _init(bool dark, {TextSize textSize}) {
    print(dark);
    this.dark = dark;
    this.textSize = textSize ??= TextSize.mid;
    if (textSize == TextSize.min) {
      mainTextSize = 14;
      subTextSize = 12;
      smallTextSize = 10;
    } else if (textSize == TextSize.big) {
      mainTextSize = 18;
      subTextSize = 16;
      smallTextSize = 14;
    } else {
      mainTextSize = 16;
      subTextSize = 14;
      smallTextSize = 12;
    }
    textColor = (dark ? Colors.white : Colors.black);
    subTextColor = (dark ? Colors.white30 : Color(0xff888888));
    if (Platform.isIOS) {
      backColor = (dark ? Color(0xB7212121) : Color(0xCCF8F8F8));
    } else {
      backColor = (dark ? Colors.black12 : Colors.white);
    }
    bodyBackColor = (dark ? Color(0xFF757575) : Color(0xffebebeb));
    unSelectTextColor = (dark ? Colors.white : Colors.grey);
  }

  static AppTheme getInstance() {
    if (_instance == null) {
      _instance = AppTheme._(false);
    }
    return _instance;
  }

  static resetAppTheme(bool dark, {TextSize textSize}) {
    _instance = null;
    _instance = AppTheme._(dark);
  }

  static FadeTransition createFadeTransition(
      Animation<double> animation, Widget child) {
    return new FadeTransition(
      opacity: animation,
      child: new RotationTransition(
        turns: new Tween<double>(begin: 1.0, end: 1.0).animate(animation),
        child: child,
      ),
    );
  }
}
