import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AuthorHeadAction { action }

class AuthorHeadActionCreator {
  static Action onAction() {
    return const Action(AuthorHeadAction.action);
  }
}
