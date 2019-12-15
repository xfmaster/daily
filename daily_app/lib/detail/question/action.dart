import 'package:daily_app/bean/question_bean.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum QuestionAction { questionData, questionLoadData }

class QuestionActionCreator {
  static Action questionData(Question bean) {
    return Action(QuestionAction.questionData, payload: bean);
  }

  static Action questionLoadData(Question bean) {
    return Action(QuestionAction.questionLoadData, payload: bean);
  }
}
