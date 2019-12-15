import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'action.dart';

Reducer<AllColumnState> buildReducer() {
  return asReducer(
    <Object, Reducer<AllColumnState>>{
    },
  );
}

AllColumnState _onAction(AllColumnState state, Action action) {
  final AllColumnState newState = state.clone();
  return newState;
}
