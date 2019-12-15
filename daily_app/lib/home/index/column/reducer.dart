import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/home/index/column/column_state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';

Reducer<ColumnItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<ColumnItemState>>{
      ColumnAction.loadColumnData: _loadColumnData,
      ColumnAction.columnData: _insertColumnData,
    },
  );
}

ColumnItemState _insertColumnData(ColumnItemState state, Action action) {
  ColumnData columnData = action.payload;
  final ColumnItemState newState = state.clone();
  if (columnData.column.id == state.bean.column.id) {
    newState..bean = columnData;
  }
  return newState;
}

ColumnItemState _loadColumnData(ColumnItemState state, Action action) {
  ColumnData columnData = action.payload;
  println("reducer----_loadColumnData");
  final ColumnItemState newState = state.clone();
  if (columnData.column.id == state.bean.column.id) {
    var i = columnData.list.length;
    var data = newState.bean;
    data.last_key = columnData.last_key;
    data.has_more = columnData.has_more;
    data.list.addAll(columnData.list);
    var length = data.list.length;
    println('current----$length==============last====$i');
    newState.bean = data;
  }
  return newState;
}
