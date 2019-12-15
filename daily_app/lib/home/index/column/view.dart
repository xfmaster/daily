import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/common/icons.dart';
import 'package:daily_app/home/index/column/column_state.dart';
import 'package:daily_app/ui/news_ui.dart';
import 'package:daily_app/view/refresh_indicator.dart';
import 'package:daily_app/view/text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'action.dart';

Widget buildView(ColumnItemState state, Dispatch dispatch, ViewService viewService) {
  var showType = state.bean.column.show_type;
  var theme = AppTheme.getInstance();
  return state.bean == null
      ? SizedBox()
      : Container(
          margin: EdgeInsets.only(top: 5),
          color: theme.backColor,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      state.bean.column.icon),
                                  fit: BoxFit.cover))),
                      onTap: () {
                        dispatch(ColumnActionCreator.columnClick(
                            state.bean.column.id));
                      },
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 12,
                      child: GestureDetector(
                        child: TitleText(
                          state.bean.column.name,
                          dark: theme.dark,
                          textAlign: TextAlign.start,
                          bold: true,
                        ),
                        onTap: () {
                          dispatch(ColumnActionCreator.columnClick(
                              state.bean.column.id));
                        },
                      ),
                    ),
                    Icon(
                      MyIcons.subscribe,
                      color: theme.backColor,
                      size: 23,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      MyIcons.share,
                      color: theme.backColor,
                      size: 20,
                    )
                  ],
                ),
              ),
              Container(
                  height: showType == 2 ? 300 : 350,
                  child: SmartRefresher(
                    enablePullUp: true,
                    enablePullDown: false,
                    scrollDirection: Axis.horizontal,
                    footer: CustomDailyFooter(
                      height: 60,
                      footDirection: FootDirection.Vertical,
                    ),
                    controller: state.refreshController,
                    onLoading: () {
                      dispatch(ColumnActionCreator.loadColumnAction(
                          state.bean));
                    },
                    child: ListView.builder(
                        itemCount: state.bean.list == null
                            ? 0
                            : state.bean.list.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              dispatch(
                                  ColumnActionCreator.columnItemClick(index));
                            },
                            child: buildColumnItemWidget(
                                state, state.bean.list[index]),
                          );
                        }),
                  ))
            ],
          ),
        );
}
