import 'package:daily_app/bean/news_bean.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ColumnAction { updateColumnTop, changeAppbarAlpha, updateListAction,loadMoreAction }

class ColumnActionCreator {
  static Action updateColumnTop(Column column) {
    return Action(ColumnAction.updateColumnTop, payload: column);
  }

  static Action changeAppbarAlpha(int alpha) {
    return Action(ColumnAction.changeAppbarAlpha, payload: alpha);
  }

  static Action updateListAction(ColumnList columnList) {
    return Action(ColumnAction.updateListAction, payload: columnList);
  }
  static Action loadMoreAction() {
    return Action(ColumnAction.loadMoreAction);
  }
}
