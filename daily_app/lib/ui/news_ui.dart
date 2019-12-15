import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/bean/news_bean.dart' as newPef;
import 'package:daily_app/common/icons.dart';
import 'package:daily_app/home/index/adapter/news_state.dart';
import 'package:daily_app/home/index/column/column_state.dart';
import 'package:daily_app/utils/date_util.dart';
import 'package:daily_app/utils/screen_util.dart';
import 'package:daily_app/view/text.dart';
import 'package:daily_app/view/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildItemView(newPef.NewsBean newsBean, {int showType = 0}) {
  var instance = AppTheme.getInstance();
  newPef.NewsBean bean = newsBean;
  var comment;
  var pushTime = bean.post.publish_time;
  String collectStr;
  String commentStr;
  var collect;
  if (bean.post.praise_count > 1000) {
    collect = (bean.post.praise_count / 100).round() / 10;
    collectStr = '$collect' + 'K';
  } else {
    collect = bean.post.praise_count;
    collectStr = '$collect';
  }
  if (bean.post.comment_count > 1000) {
    comment = (bean.post.comment_count / 100).round() / 10;
    commentStr = '$comment' + 'K';
  } else {
    comment = bean.post.comment_count;
    commentStr = '$comment';
  }
  String timeStr = DateUtil.getOffsetDate(pushTime);
  return Wrap(
    crossAxisAlignment: WrapCrossAlignment.start,
    direction: Axis.horizontal,
    children: <Widget>[
      showType == 0 || showType == 1
          ? (bean.type == 0
              ? SizedBox()
              : SubTitleText(
                  bean.post.category.title,
                  maxLines: 1,
                  style: TextStyle(fontSize: 10, color: instance.subTextColor),
                  textSize: instance.textSize,
                ))
          : SizedBox(),
      SizedBox(
        width: bean.type == 0 ? 0 : 10,
      ),
      comment == 0
          ? SizedBox()
          : Padding(
              padding: EdgeInsets.only(top: 3),
              child: Icon(
                MyIcons.comment,
                size: 13,
                color: instance.subTextColor,
              ),
            ),
      SizedBox(
        width: comment == 0 ? 0 : 4,
      ),
      comment == 0
          ? SizedBox()
          : Padding(
              padding: EdgeInsets.only(top: 3),
              child: SubTitleText(
                '$commentStr',
                maxLines: 1,
                style: TextStyle(fontSize: 10, color: instance.subTextColor),
                textSize: instance.textSize,
              )),
      SizedBox(
        width: comment == 0 ? 0 : 10,
      ),
      Icon(
        MyIcons.collect,
        size: 15,
        color: instance.subTextColor,
      ),
      Padding(
        padding: EdgeInsets.only(top: 3, left: 4),
        child: SubTitleText(
          '$collectStr',
          maxLines: 1,
          style: TextStyle(fontSize: 10, color: instance.subTextColor),
          textSize: instance.textSize,
        ),
      ),
      SizedBox(
        width: 10,
      ),
      showType == 0 || showType == 1
          ? SubTitleText(
              timeStr,
              maxLines: 1,
              style: TextStyle(fontSize: 10, color: instance.subTextColor),
              textSize: instance.textSize,
            )
          : SizedBox(),
    ],
  );
}

//通栏样式
Widget buildNormalWidget(NewsItemState state) {
  var bean = state.bean;
  AppTheme appTheme = AppTheme.getInstance();
  return Container(
    margin: EdgeInsets.only(top: 5),
    color: appTheme.backColor,
    padding: EdgeInsets.only(bottom: 10),
    width: ScreenUtils.width,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildImage(bean.image),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: TitleText(
            bean.post.title,
            dark: appTheme.dark,
            textSize: appTheme.textSize,
            bold: true,
            maxLines: 2,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 5),
          child: SubTitleText(
            bean.post.description,
            maxLines: 2,
            dark: appTheme.dark,
            textSize: appTheme.textSize,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 5, right: 10),
          child: buildItemView(bean),
        ),
      ],
    ),
  );
}

//栏目
Widget buildColumnItemWidget(ColumnItemState state, newPef.NewsBean bean) {
  var show_type = state.bean.column.show_type;
  var appTheme = AppTheme.getInstance();
  return Container(
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      border: Border.all(color: appTheme.backColor, width: 0.5),
    ),
    width: show_type == 1 ? 280 : 150,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildImage(bean.image, width: show_type == 1 ? 280 : 150, height: 200),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: TitleText(
            bean.post.title,
            dark: appTheme.dark,
            textSize: appTheme.textSize,
            bold: true,
            maxLines: 2,
          ),
        ),
        show_type == 1
            ? Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                child: SubTitleText(
                  bean.post.description,
                  maxLines: 2,
                  dark: appTheme.dark,
                  textSize: appTheme.textSize,
                ),
              )
            : SizedBox(),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 5, right: 10),
          child: buildItemView(bean),
        ),
      ],
    ),
  );
}
