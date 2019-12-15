import 'package:daily_app/bean/news_bean.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum IndexAction {
  refreshDataAction,
  refreshAction,
  loadAction,
  loadDataAction,
}

class IndexActionCreator {
  static Action refreshDataAction(Data bean) {
    return Action(IndexAction.refreshDataAction, payload: bean);
  }

  static Action loadDataAction(Data bean) {
    return Action(IndexAction.loadDataAction, payload: bean);
  }

  static Action refreshAction() {
    return Action(IndexAction.refreshAction);
  }

  static Action loadAction() {
    return Action(IndexAction.loadAction);
  }
}
