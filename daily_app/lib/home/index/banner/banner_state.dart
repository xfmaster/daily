import 'package:daily_app/base/base_item.dart';
import 'package:daily_app/bean/news_bean.dart';

class BannerItemState extends BaseItem<List<NewsBean>> {
  @override
  BannerItemState clone() {
    return BannerItemState()
      ..bean = bean
      ..type = type;
  }

  @override
  String type = "banner";
}

BannerItemState initBannerItemState(List<NewsBean> list) {
  return new BannerItemState()..bean = list;
}
