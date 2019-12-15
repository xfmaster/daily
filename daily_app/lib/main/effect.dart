import 'package:daily_app/utils/screen_util.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(
      <Object, Effect<MainState>>{});
}

