import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/bean/all_column.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'adapter/state.dart';

class AllColumnState extends GlobalBaseState
    implements Cloneable<AllColumnState> {
  List<AllColumnItemState> list;
  RefreshController refreshController;
  AllColumnData columnData;

  @override
  AllColumnState clone() {
    return AllColumnState()
      ..appTheme = appTheme
      ..columnData = columnData
      ..list = list
      ..refreshController = refreshController;
  }

  @override
  AppTheme appTheme;
}

AllColumnState initState(Map<String, dynamic> args) {
  return AllColumnState()..refreshController = new RefreshController();
}
