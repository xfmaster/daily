import 'package:daily_app/bean/question_bean.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<QuestionState> buildReducer() {
  return asReducer(
    <Object, Reducer<QuestionState>>{
      QuestionAction.questionData: _questionData,
    },
  );
}

QuestionState _questionData(QuestionState state, Action action) {
  Question question = action.payload;
  final QuestionState newState = state.clone();
  newState.bean = question.newsBean;
  newState.list = question.list;
  return newState;
}
