import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum TopicAction { action }

class TopicActionCreator {
  static Action onAction() {
    return const Action(TopicAction.action);
  }
}
