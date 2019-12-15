import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PasswordAction { changeEnableAction, passwordEnableAction, }

class PasswordActionCreator {
  static Action changeEnableAction(bool enable) {
    return Action(PasswordAction.changeEnableAction, payload: enable);
  }

  static Action passwordEnableAction() {
    return Action(PasswordAction.passwordEnableAction);
  }
}
