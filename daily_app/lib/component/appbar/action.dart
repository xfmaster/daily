import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AppBarAction { backAction }

class AppBarActionCreator {
  static Action backAction() {
    return const Action(AppBarAction.backAction);
  }
}
