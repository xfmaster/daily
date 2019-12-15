import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ItemAction { itemAction }

class ItemActionCreator {
  static Action onItemAction(NewsItemState state) {
    return Action(ItemAction.itemAction, payload: state);
  }
}
