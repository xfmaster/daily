import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:daily_app/ui/news_ui.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';

Widget buildView(
    NewsItemState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () {
      dispatch(NormalActionCreator.itemClickAction(state));
    },
    child: buildNormalWidget(state),
  );
}
