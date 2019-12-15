import 'package:daily_app/bean/news_bean.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ColumnAction {
  columnData,
  loadColumnData,
  loadColumnAction,
  columnItemClick,
  columnClick
}

class ColumnActionCreator {
  static Action loadColumnAction(ColumnData data) {
    return Action(ColumnAction.loadColumnAction, payload: data);
  }

  static Action columnData(ColumnData data) {
    return Action(ColumnAction.columnData, payload: data);
  }

  static Action loadColumnData(ColumnData data) {
    return Action(ColumnAction.loadColumnData, payload: data);
  }

  static Action columnItemClick(int index) {
    return Action(ColumnAction.columnItemClick, payload: index);
  }

  static Action columnClick(int id) {
    return Action(ColumnAction.columnClick, payload: id);
  }
}
