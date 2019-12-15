import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainAction { action }

class MainActionCreator {
  static Action onAction() {
    return const Action(MainAction.action);
  }
}
