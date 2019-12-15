import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:daily_app/ui/news_ui.dart';
import 'package:daily_app/view/text.dart';
import 'package:daily_app/view/ui.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'action.dart';

Widget buildView(NewsItemState state, Dispatch dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () {
      dispatch(ItemActionCreator.onItemAction(state));
    },
    child: Container(
      color: AppTheme.getInstance().backColor,
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TitleText(
                    state.bean.post.title,
                    dark: AppTheme.getInstance().dark,
                    textSize: AppTheme.getInstance().textSize,
                    bold: true,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildItemView(state.bean)
                ],
              ),
            ),
          ),
          Expanded(child: buildImage(state.bean.image)),
        ],
      ),
    ),
  );
}
