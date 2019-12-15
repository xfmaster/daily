import 'package:daily_app/bean/author.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AuthorHomeAction {
  updateDataAction,
  loadMoreAction,
  changeAppbarAlpha,
  updateTitleVisible,
  backAction
}

class AuthorHomeActionCreator {
  static Action updateDataAction(AuthorBean bean) {
    return Action(AuthorHomeAction.updateDataAction, payload: bean);
  }

  static Action changeAppbarAlpha(int alpha) {
    return Action(AuthorHomeAction.changeAppbarAlpha, payload: alpha);
  }

  static Action updateTitleVisible(bool visible) {
    return Action(AuthorHomeAction.updateTitleVisible, payload: visible);
  }

  static Action loadMoreAction() {
    return Action(
      AuthorHomeAction.loadMoreAction,
    );
  }

  static Action backAction() {
    return Action(
      AuthorHomeAction.backAction,
    );
  }
}
