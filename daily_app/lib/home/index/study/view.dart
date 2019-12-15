import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/common/icons.dart';
import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:daily_app/home/index/effect.dart';
import 'package:daily_app/view/text.dart';
import 'package:daily_app/view/ui.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'action.dart';

Widget buildView(NewsItemState state, Dispatch dispatch, ViewService viewService) {
  var appTheme = AppTheme.getInstance();
  return GestureDetector(
    onTap: () {
      dispatch(StudyActionCreator.onItemClick(state.bean));
    },
    child: Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.only(bottom: 10),
      color: appTheme.backColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          state.isTopic
              ? SizedBox()
              : Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      NetworkImage(state.bean.post.column.icon),
                                  fit: BoxFit.cover))),
                      SizedBox(
                        width: 10,
                      ),
                      TitleText(
                        state.bean.post.column.name,
                        dark: appTheme.dark,
                        textAlign: TextAlign.start,
                        bold: true,
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Icon(
                        MyIcons.share,
                        color: appTheme.backColor,
                        size: 20,
                      )
                    ],
                  ),
                ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              buildImage(state.bean.image, width: itemWidth, height: 180),
              Positioned(
                child: Image.asset(
                  state.isTopic
                      ? "assets/icon_lab_vot_join.png"
                      : "assets/icon_lab_vot_new.png",
                  height: 55,
                  width: 70,
                  fit: BoxFit.fill,
                ),
                right: 15,
                top: 15,
              ),
              Positioned(
                child: Image.network(
                  state.bean.post.category.image_lab,
                  width: 30,
                ),
                left: 20,
                bottom: 20,
              ),
              state.isTopic
                  ? Positioned(
                      child: TitleText(
                        state.bean.post.record_count.toString(),
                        color: Colors.yellowAccent,
                        bold: true,
                      ),
                      top: 18,
                      right: 25,
                    )
                  : SizedBox()
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: TitleText(
              state.bean.post.title,
              dark: appTheme.dark,
              textAlign: TextAlign.start,
              bold: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: SubTitleText(
              state.bean.post.description,
              maxLines: 2,
              dark: appTheme.dark,
              textSize: appTheme.textSize,
            ),
          )
        ],
      ),
    ),
  );
}
