import 'package:daily_app/bean/news_bean.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum StudyAction { onItemClickAction }

class StudyActionCreator {
  static Action onItemClick(NewsBean bean) {
    return Action(StudyAction.onItemClickAction, payload: bean);
  }
}
