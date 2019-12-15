import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/bean/question_bean.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:daily_app/component/toolbar/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class QuestionState with MapLike implements Cloneable<QuestionState> {
  RefreshController refreshController;
  int id;
  NewsBean bean;
  List<QuestionBean> list;

  @override
  QuestionState clone() {
    return QuestionState()
      ..refreshController = refreshController
      ..bean = bean
      ..id = id
      ..list = list
      ..[ComponentKey.toolBar] = this[ComponentKey.toolBar];
  }
}

QuestionState initState(Map<String, dynamic> args) {
  ToolBarState toolBarState = new ToolBarState();
  toolBarState.showComment = false;
  toolBarState.showCollect = false;
  return QuestionState()
    ..[ComponentKey.toolBar] = toolBarState
    ..refreshController = new RefreshController()
    ..id = args['id'];
}
