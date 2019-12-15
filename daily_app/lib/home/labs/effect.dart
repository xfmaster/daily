import 'package:daily_app/bean/lab_bean.dart';
import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/http/api.dart';
import 'package:daily_app/http/http.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<LabsState> buildEffect() {
  return combineEffects(<Object, Effect<LabsState>>{
    Lifecycle.initState: _init,
    LabsAction.refreshAction: _init,
    LabsAction.loadAction: _loadAction,
  });
}

void _init(Action action, Context<LabsState> ctx) {
  requestGet(API_LABS).then((res) {
    ctx.state.refreshController.refreshCompleted();
    if (res['error'] == 400) return;
    ctx.dispatch(LabsActionCreator.refreshData(bundleData(res)));
  });
}

LabBean bundleData(var res) {
  var feeds = res["feeds"];
  List<NewsBean> list = new List();
  for (int i = 0; i < feeds.length; i++) {
    list.add(NewsBean.fromJson(feeds[i]));
  }
  List<Topic> topics=new List();
  var topicsJsonArray = res['paper_topics'];
  for (int i = 0; i < topicsJsonArray.length; i++) {
    topics.add(Topic.fromJson(topicsJsonArray[i]));
  }
  return new LabBean(
      feeds: list,
      last_key: res['last_key'],
      has_more: res['has_more'],
      paper_topics: topics);
}

void _loadAction(Action action, Context<LabsState> ctx) {
  int lastKey = ctx.state.lastKey;
  if (ctx.state.hasMore) {
    requestGet(API_LABS_LOAD + "$lastKey.json").then((res) {
      ctx.state.refreshController.loadComplete();
      if (res['error'] == 400) return;
      ctx.dispatch(LabsActionCreator.loadData(bundleData(res)));
    });
  }
}
