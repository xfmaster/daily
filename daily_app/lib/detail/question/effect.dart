import 'package:daily_app/bean/news_bean.dart';
import 'package:daily_app/bean/question_bean.dart';
import 'package:daily_app/http/api.dart';
import 'package:daily_app/http/http.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<QuestionState> buildEffect() {
  return combineEffects(<Object, Effect<QuestionState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<QuestionState> ctx) {
  var id = ctx.state.id;
  requestGet(API_QUESTION + "$id.json").then((res) {
    if (res['error'] == 400) return;
    var newsBean = NewsBean.fromJson(res);
    var questionJsonArray = res['options'];
    List<QuestionBean> list = new List();
    for (int i = 0; i < questionJsonArray.length; i++) {
      var question = QuestionBean.fromJson(questionJsonArray[i]);
      list.add(question);
    }
    ctx.dispatch(
        QuestionActionCreator.questionData(new Question(list, newsBean)));
  });
}
