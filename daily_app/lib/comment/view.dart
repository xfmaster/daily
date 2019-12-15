import 'package:daily_app/base/basic.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommentState state, Dispatch dispatch, ViewService viewService) {
  return PlatformScaffold(
    appBar: viewService.buildComponent("appbar"),
  );
}
