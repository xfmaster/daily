import 'dart:ui';

import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/bean/author.dart';
import 'package:daily_app/utils/screen_util.dart';
import 'package:daily_app/view/text.dart';
import 'package:daily_app/view/ui.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'author_state.dart';

Widget buildView(AuthorItemState state, Dispatch dispatch, ViewService viewService) {
  var top = MediaQueryData.fromWindow(window).padding.top;
  var avatar = state.bean?.avatar;
  avatar = (avatar == null ? '' : avatar);
  var name = state.bean?.name;
  name = (name == null ? '' : name);
  var description = state.bean?.description;
  description = (description == null ? '' : description);
  List<SpecialColumn> list = state.bean?.special_column;
  return Stack(
    children: <Widget>[
      buildImage(avatar, width: ScreenUtils.width, height: 280,fit: BoxFit.contain),
      ClipRect(
        ///必须加上这个，不然全屏模糊
        child: Container(
          color: Colors.white.withOpacity(0.1),
          padding: EdgeInsets.only(top: top + 20, left: 50, right: 50),
          height: 280,
          width: ScreenUtils.width,
          child: BackdropFilter(
            filter: new ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
            ),
            child: Column(
              children: <Widget>[
                ClipOval(
                  child: buildImage(avatar, width: 80, height: 80),
                ),
                SizedBox(
                  height: 10,
                ),
                TitleText(name),
                SizedBox(
                  height: 10,
                ),
                SubTitleText(description),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding:
            EdgeInsets.only(top: list == null || list.length == 0 ? 180 : 220),
        child: SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: list == null
                ? []
                : list.map((bean) => _buildColumn(bean)).toList(),
          ),
        ),
      ),
    ],
  );
}

Widget _buildColumn(
  SpecialColumn column,
) {
  var image = column.image ??= "";
  var name = column.name ??= "";
  var subscriber_num = column.subscriber_num;
  var post_count = column.post_count;
  return Container(
    decoration: BoxDecoration(
      color: AppTheme.getInstance().backColor,
      borderRadius: BorderRadius.circular(5),
      //阴影设置
      boxShadow: [
        BoxShadow(
          blurRadius: 6,
          spreadRadius: 4,
          color: Color.fromARGB(20, 0, 0, 0),
        ),
      ],
    ),
    width: 300,
    height: 100,
    margin: EdgeInsets.only(left: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        buildImage(image, height: 60, width: 60),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(
                name,
                bold: true,
                maxLines: 1,
              ),
              SizedBox(
                height: 10,
              ),
              SubTitleText(
                '$subscriber_num人已订阅，更新至$post_count篇',
                maxLines: 2,
              )
            ],
          ),
        ),
        Image.asset(
          'assets/icon_column_subscribe.png',
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    ),
  );
}
