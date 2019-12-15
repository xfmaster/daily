import 'package:daily_app/bean/lab_bean.dart';
import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:daily_app/home/labs/topic/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<LabsState> buildReducer() {
  return asReducer(
    <Object, Reducer<LabsState>>{
      LabsAction.refreshData: _refreshData,
      LabsAction.loadData: _loadData,
    },
  );
}

LabsState _refreshData(LabsState state, Action action) {
  LabBean bean = action.payload;
  final LabsState newState = state.clone();
  newState.list = new List();
  _bundleData(newState, bean, true);
  return newState;
}

LabsState _loadData(LabsState state, Action action) {
  LabBean bean = action.payload;
  final LabsState newState = state.clone();
  _bundleData(newState, bean, false);
  return newState;
}

void _bundleData(LabsState newState, LabBean bean, bool isRefresh) {
  newState.lastKey = bean.last_key;
  newState.hasMore = bean.has_more;
  bean.feeds.forEach((bean) {
    newState.list.add(initNewsItemState(bean, isTopic: true));
  });
  if (bean.paper_topics.length > 0) {
    bean.paper_topics.forEach((topic) {
      if (topic.insert_location != null && newState.lastId != topic.id) {
        var location =
            topic.insert_location + (isRefresh ? 0 : newState.list.length);
        if (location >= newState.list.length) {
          newState.list.add(initTopicItemState(topic));
        } else {
          newState.list.insert(location, initTopicItemState(topic));
        }
      }
      newState.lastId = topic.id;
    });
  }
}
