import 'package:daily_app/home/index/banner/banner_state.dart';
import 'package:fish_redux/fish_redux.dart';

Reducer<BannerItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<BannerItemState>>{
    },
  );
}

BannerItemState _onAction(BannerItemState state, Action action) {
  final BannerItemState newState = state.clone();
  return newState;
}
