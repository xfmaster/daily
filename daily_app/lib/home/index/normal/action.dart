import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum NormalAction { itemAction }

class NormalActionCreator {
  static Action itemClickAction(NewsItemState state) {
    return  Action(NormalAction.itemAction, payload: state);
  }
}
