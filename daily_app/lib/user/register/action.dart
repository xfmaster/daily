import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RegisterAction { userAgreementAction,pushLoginAction }

class RegisterActionCreator {
  static Action userAgreementAction() {
    return const Action(RegisterAction.userAgreementAction);
  }
  static Action pushLoginAction() {
    return const Action(RegisterAction.pushLoginAction);
  }
}
