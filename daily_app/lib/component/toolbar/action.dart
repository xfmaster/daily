import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ToolBarAction { backAction }

class ToolBarActionCreator {
  static Action backAction() {
    return const Action(ToolBarAction.backAction);
  }
}
