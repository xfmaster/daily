import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum BannerAction { onTapAction }

class BannerActionCreator {
  static Action onTapAction(int index) {
    return Action(BannerAction.onTapAction, payload: index);
  }
}
