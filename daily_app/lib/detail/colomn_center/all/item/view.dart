import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/detail/colomn_center/all/action.dart';
import 'package:daily_app/detail/colomn_center/all/adapter/action.dart';
import 'package:daily_app/detail/colomn_center/all/adapter/state.dart';
import 'package:daily_app/view/text.dart';
import 'package:daily_app/view/ui.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildView(
    AllColumnItemState state, Dispatch dispatch, ViewService viewService) {
  var subscriber_num = state.column.subscriber_num;
  var post_count = state.column.post_count;
  return GestureDetector(
    onTap: () {
      dispatch(AllColumnItemActionCreator.onItemClickAction(state.column));
    },
    child: Container(
      color: AppTheme.getInstance().backColor,
      padding: EdgeInsets.all(10),
      height: 140,
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildImage(state.column.image, width: 100, height: 100),
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 1,
            child: SafeArea(
              right: true,
              left: true,
              child: Container(
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    TitleText(
                      state.column.name,
                      bold: true,
                    ),
                    SubTitleText(
                      state.column.description,
                      maxLines: 2,
                      color: AppTheme.getInstance().textColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SubTitleText(
                      '$subscriber_num人已订阅，更新至$post_count篇',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/all_column_unsub.png',
            width: 40,
            height: 40,
          ),
        ],
      ),
    ),
  );
}
