import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeAction { changeThemeAction, hideButtonAction, showMenuAction }

class HomeActionCreator {
  static Action changeThemeAction(bool dark) {
    return Action(HomeAction.changeThemeAction, payload: dark);
  }

  static Action hideButtonAction(bool hide) {
    return Action(HomeAction.hideButtonAction, payload: hide);
  }

  static Action showMenuAction() {
    return Action(HomeAction.showMenuAction);
  }
}
