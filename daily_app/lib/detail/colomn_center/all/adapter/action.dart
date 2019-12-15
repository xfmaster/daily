import 'package:daily_app/bean/news_bean.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AllColumnAction { onItemClickAction }

class AllColumnItemActionCreator {
  static Action onItemClickAction(Column column) {
    return Action(AllColumnAction.onItemClickAction, payload: column);
  }
}
