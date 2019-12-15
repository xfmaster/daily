import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HeadAction { action }

class HeadActionCreator {
  static Action onAction() {
    return const Action(HeadAction.action);
  }
}
