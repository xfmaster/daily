import 'package:daily_app/base/base_item.dart';
import 'package:daily_app/bean/news_bean.dart';

class NewsItemState extends BaseItem<NewsBean> {
  bool isTopic;

  @override
  NewsItemState clone() {
    return NewsItemState().clone()
      ..bean = bean
      ..type = type
      ..isTopic = isTopic;
  }

  @override
  String get type {
    return (bean.type == 1 ? "item" : (bean.type == 2 ? "normal" : "study"));
  }

  @override
  set type(String type) {}
}

NewsItemState initNewsItemState(NewsBean bean, {bool isTopic = false}) {
  return NewsItemState()
    ..bean = bean
    ..isTopic = isTopic;
}
