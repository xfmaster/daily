import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MenuState> buildReducer() {
  return asReducer(
    <Object, Reducer<MenuState>>{
      MenuAction.changeAction: _changeAction,
      MenuAction.updateCategory: _updateCategory,
      MenuAction.selectIndex: _selectIndex,
    },
  );
}

MenuState _changeAction(MenuState state, Action action) {
  final MenuState newState = state.clone();
  return newState;
}

MenuState _updateCategory(MenuState state, Action action) {
  final MenuState newState = state.clone()..list=action.payload;
  return newState;
}
MenuState _selectIndex(MenuState state, Action action) {
  final MenuState newState = state.clone()..selectIndex=action.payload;
  return newState;
}
