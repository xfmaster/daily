import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/common/icons.dart';
import 'package:daily_app/view/text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ToolBarState state, Dispatch dispatch, ViewService viewService) {
  var collect = state.collect;
  var comment = state.comment;
  return Container(
    padding: EdgeInsets.only(top: 10, bottom: 15),
    color: state.toolbarColor,
    height: 50,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            dispatch(ToolBarActionCreator.backAction());
          },
          child: Container(
            height: 50,
            width: 50,
            child: Icon(
              MyIcons.back,
              color: state.toolbarTextColor,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(),
        ),
        state.showComment
            ? Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 20 + ("$comment".length) * 10.toDouble(),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Icon(
                      MyIcons.comment,
                      size: 22,
                      color: state.toolbarTextColor,
                    ),
                  ),
                  Text(
                    "$comment",
                    style:
                        TextStyle(color: state.toolbarTextColor, fontSize: 12),
                  ),
                ],
              )
            : SizedBox(),
        SizedBox(
          width: 20,
        ),
        state.showCollect
            ? Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 20 + ("$collect".length) * 10.toDouble(),
                  ),

                  ///站空间
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Icon(
                      MyIcons.collect,
                      size: 25,
                      color: state.toolbarTextColor,
                    ),
                  ),
                  Text(
                    "$collect",
                    style:
                        TextStyle(color: state.toolbarTextColor, fontSize: 12),
                  ),
                ],
              )
            : Icon(
                MyIcons.edit,
                color: state.toolbarTextColor,
              ),
        SizedBox(
          width: 20,
        ),
        Icon(
          MyIcons.share,
          color: state.toolbarTextColor,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}
