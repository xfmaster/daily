import 'package:daily_app/bean/category.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/painting.dart';

//TODO replace with your own action
enum MenuAction {
  changeAction,
  closeMenuAction,
  menuItemClick,
  updateCategory,
  selectIndex,
  onCategoryItemClick
}

class MenuActionCreator {
  static Action changeAction() {
    return Action(MenuAction.changeAction);
  }

  static Action closeMenuAction() {
    return Action(MenuAction.closeMenuAction);
  }

  static Action menuItemClick(String text) {
    return Action(MenuAction.menuItemClick, payload: text);
  }

  static Action updateCategory(List<Category> list) {
    return Action(MenuAction.updateCategory, payload: list);
  }

  static Action selectIndex(int index) {
    return Action(MenuAction.selectIndex, payload: index);
  }
  static Action onCategoryItemClick(int index) {
    return Action(MenuAction.onCategoryItemClick, payload: index);
  }
}
