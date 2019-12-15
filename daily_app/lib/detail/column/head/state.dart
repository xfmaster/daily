import 'package:daily_app/base/base_item.dart';
import 'package:daily_app/bean/news_bean.dart';

class ColumnHeadState extends BaseItem<ColumnData> {
  @override
  String type = 'head';

  @override
  ColumnHeadState clone() {
    return ColumnHeadState()
      ..type = type
      ..bean = bean;
  }
}

ColumnHeadState initColumnHeadState(ColumnData columnData) {
  return ColumnHeadState()..bean = columnData;
}
