import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TextFieldAction { changeEnableAction }

class TextFieldActionCreator {
  static Action changeEnableAction(bool enable) {
    return Action(TextFieldAction.changeEnableAction, payload: enable);
  }
}
