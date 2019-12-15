import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:fish_redux/fish_redux.dart';

Reducer<NewsItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<NewsItemState>>{
    },
  );
}

NewsItemState _onAction(NewsItemState state, Action action) {
  final NewsItemState newState = state.clone();
  return newState;
}
