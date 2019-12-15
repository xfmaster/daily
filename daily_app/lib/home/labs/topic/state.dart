import 'package:daily_app/base/base_item.dart';
import 'package:daily_app/bean/lab_bean.dart';
import 'package:fish_redux/fish_redux.dart';

class TopicItemState extends BaseItem<Topic> {
  @override
  TopicItemState clone() {
    return TopicItemState()..bean = bean;
  }

  @override
  String type = 'topics';
}

TopicItemState initTopicItemState(Topic topic) {
  return TopicItemState()..bean = topic;
}
