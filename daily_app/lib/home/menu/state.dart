import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/bean/category.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class MenuState implements Cloneable<MenuState>, GlobalBaseState {
  Color color;
  Animation<Offset> bottomAnimation;
  Animation<Offset> columnAnimation;
  Animation<Offset> topAnimation;
  List<Category> list;
  int selectIndex;

  @override
  MenuState clone() {
    return MenuState()
      ..color = color
      ..appTheme = appTheme
      ..bottomAnimation = bottomAnimation
      ..columnAnimation = columnAnimation
      ..list = list
      ..topAnimation = topAnimation
      ..selectIndex = selectIndex;
  }

  @override
  AppTheme appTheme;
}

MenuState initState(Map<String, dynamic> args) {
  return MenuState()..selectIndex = 0;
}
