import 'package:fish_redux/fish_redux.dart';

enum CommonAction { buttonEnableNotify, loginSuccessAction }

class CommonActionCreator {
  static Action buttonEnableNotifyAction() {
    return const Action(CommonAction.buttonEnableNotify);
  }

  static Action loginSuccessAction() {
    return const Action(CommonAction.loginSuccessAction);
  }
}
