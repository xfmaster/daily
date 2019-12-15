import 'package:daily_app/bean/all_column.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'adapter/state.dart';
import 'state.dart';

Reducer<AllColumnState> buildReducer() {
  return asReducer(
    <Object, Reducer<AllColumnState>>{
      AllColumnAction.updateAllColumn: _updateAllColumn,
    },
  );
}

AllColumnState _updateAllColumn(AllColumnState state, Action action) {
  final AllColumnState newState = state.clone();
  newState.list ??= new List();
  AllColumnData columnData = action.payload;
  if (columnData.isRefresh && newState.list.length > 0) {
    newState.list.clear();
  }
  for (var value in columnData.list) {
    newState.list.add(initAllColumnItemState(value));
  }
  return newState..columnData = columnData;
}
