import 'package:daily_app/base/base_item.dart';
import 'package:daily_app/bean/news_bean.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ColumnItemState extends BaseItem<ColumnData> {
  RefreshController refreshController;

  @override
  ColumnItemState clone() {
    return ColumnItemState()
      ..bean = bean
      ..refreshController = refreshController
      ..type = type;
  }

  @override
  String type = "column";
}

ColumnItemState initColumnItemState(ColumnData columnData) {
  return ColumnItemState()
    ..refreshController = new RefreshController()
    ..bean = columnData;
}
