import 'package:daily_app/detail/column/head/state.dart';
import 'package:daily_app/utils/screen_util.dart';
import 'package:daily_app/view/text.dart';
import 'package:daily_app/view/ui.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(ColumnHeadState state, Dispatch dispatch, ViewService viewService) {
  var subscriber_num = state?.bean?.column?.subscriber_num;
  var image = state?.bean?.column?.image;
  var name = state?.bean?.column?.name;
  var description = state?.bean?.column?.description;
  return Column(
    children: <Widget>[
      Container(
        height: 350,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            buildImage(image ??= '', width: ScreenUtils.width),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 180,
                  ),
                  TitleText(
                    name ??= '',
                    textAlign: TextAlign.center,
                    bold: true,
                    color: Colors.white,
                  ),
                  SubTitleText(
                    description ??= '',
                    textAlign: TextAlign.left,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/icon_column_subscribe.png',
                    height: 60,
                    width: 60,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 40,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 0.2,
                color: Color(0xffa8a8a8),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            SubTitleText(
              "$subscriber_num人订阅了本栏目",
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 0.2,
                color: Color(0xffa8a8a8),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
