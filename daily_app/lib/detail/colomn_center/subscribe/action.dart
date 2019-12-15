import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SubscribeAction { action }

class SubscribeActionCreator {
  static Action onAction() {
    return const Action(SubscribeAction.action);
  }
}
