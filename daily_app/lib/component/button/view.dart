import 'package:daily_app/view/text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ButtonState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () {
      dispatch(ButtonActionCreator.onClickAction());
    },
    child: Container(
      margin: EdgeInsets.only(
        left: 80,
        right: 80,
      ),
      padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: state.isEnable ? Colors.amber : Colors.amberAccent,
          borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: TitleText(
          state.text,
          color: Colors.white,
        ),
      ),
    ),
  );
}
