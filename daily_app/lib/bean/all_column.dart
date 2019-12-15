import 'base.dart';
import 'news_bean.dart';

class AllColumnData extends BaseListBean<Column> {
  AllColumnData(lastKey, bool hasMore, List<Column> list, bool isRefresh)
      : super(lastKey, hasMore, list, isRefresh);
}
