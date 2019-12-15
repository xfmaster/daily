import 'package:daily_app/base/basic.dart';
import 'package:daily_app/view/barrage_widget.dart';
import 'package:daily_app/view/refresh_indicator.dart';
import 'package:daily_app/view/text.dart';
import 'package:daily_app/view/ui.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';
import 'state.dart';
import 'dart:ui';

Widget buildView(
    QuestionState state, Dispatch dispatch, ViewService viewService) {
  return PlatformScaffold(
    showLoading: state.bean == null,
    body: state.bean == null
        ? SizedBox()
        : Column(
            children: <Widget>[
              Expanded(
                  child: SmartRefresher(
                controller: state.refreshController,
                enablePullUp: true,
                enablePullDown: false,
                footer: CustomDailyFooter(
                  height: 40,
                ),
                onLoading: () {},
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQueryData.fromWindow(window).padding.top,
                    ),
                    Stack(
                      children: <Widget>[
                        buildImage(state.bean?.image, height: 250),
                        Positioned(
                          child: Image.asset(
                            "assets/icon_lab_vot_join.png",
                            height: 55,
                            width: 70,
                            fit: BoxFit.fill,
                          ),
                          right: 15,
                          top: 15,
                        ),
                        BarrageWidget(
                            itemCount: state.list.length,
                            builder: (BuildContext context, int index) {
                              return Text(
                                state.list[index].content,
                                maxLines: 1,
                              );
                            },
                            itemTextLength: (BuildContext context, int index) {
                              return state.list[index].content.length;
                            }),
                        Positioned(
                          child: TitleText(
                            state.bean?.post?.record_count.toString(),
                            color: Colors.yellowAccent,
                            bold: true,
                          ),
                          top: 18,
                          right: 25,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: TitleText(
                          state.bean.post.title,
                          textAlign: TextAlign.start,
                          bold: true,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: SubTitleText(
                        state.bean.post.description,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              )),
              viewService.buildComponent("toolBar")
            ],
          ),
  );
}
