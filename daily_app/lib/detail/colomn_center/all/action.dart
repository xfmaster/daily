import 'package:daily_app/bean/all_column.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AllColumnAction { refreshAction, loadMoreAction, updateAllColumn }

class AllColumnActionCreator {
  static Action updateAllColumn(AllColumnData data) {
    return Action(AllColumnAction.updateAllColumn, payload: data);
  }

  static Action refreshAction() {
    return Action(AllColumnAction.refreshAction);
  }

  static Action loadMoreAction() {
    return Action(AllColumnAction.loadMoreAction);
  }
}
