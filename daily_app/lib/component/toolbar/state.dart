import 'dart:ui';

import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/component/component_key.dart';
import 'package:fish_redux/fish_redux.dart';

import '../base_component_state.dart';

class ToolBarState with BaseComponentState implements Cloneable<ToolBarState> {
  bool showComment;
  bool showCollect;
  int collect;
  int comment;
  Color toolbarColor;
  Color toolbarTextColor;

  @override
  ToolBarState clone() {
    println("ToolBarState clone");
    return ToolBarState()
      ..showCollect = showCollect
      ..comment = comment
      ..collect = collect
      ..toolbarColor = toolbarColor
      ..toolbarTextColor = toolbarTextColor
      ..showComment = showComment
      ..isInit = isInit;
  }
}

ToolBarState initToolBarState(MapLike map) {
  ToolBarState toolBarState = map[ComponentKey.toolBar];
  toolBarState.toolbarColor ??= AppTheme.getInstance().backColor;
  toolBarState.toolbarTextColor ??= AppTheme.getInstance().textColor;
  toolBarState.showComment ??= true;
  toolBarState.showCollect ??= true;
  toolBarState.collect ??= 0;
  toolBarState.comment ??= 0;
  toolBarState.isInit = true;
  toolBarState.toolbarTextColor ??= AppTheme.getInstance().textColor;
  return toolBarState;
}

class ToolBarStateConnOp<T extends MapLike, P> extends ConnOp<T, P> {
  final String key;
  final P Function(T state) init;

  ToolBarStateConnOp({this.init, String key}) : key = key ?? ('');

  @override
  P get(T state) {
    return state.containsKey(key) ? state[key] : (state[key] = init(state));
  }

  @override
  void set(T state, P subState) {
    state[key] = subState;
  }
}
