import 'package:daily_app/base/basic.dart';
import 'package:daily_app/bean/category.dart';
import 'package:daily_app/common/icons.dart';
import 'package:daily_app/view/bottom_menu.dart';
import 'package:daily_app/view/text.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(MenuState state, Dispatch dispatch, ViewService viewService) {
  println("buildView menu");
  return PlatformScaffold(
    backgroundColor: state.appTheme.bodyBackColor,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 48,
        ),
        SlideTransition(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                decoration: BoxDecoration(
                  color: state.appTheme.backColor, // 底色
                  shape: BoxShape.rectangle, // 默认值也是矩形
                  borderRadius: new BorderRadius.circular((5.0)), // 圆角度
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      MyIcons.search,
                      size: 20,
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: state.appTheme.textColor,
                        decoration: InputDecoration(
                          hintText: "搜索",
                          contentPadding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40, right: 40, top: 20),
                child: Row(
                  children: <Widget>[
                    buildTopItem(MyIcons.setting, state, "设置", dispatch),
                    buildTopItem(MyIcons.night, state,
                        state.appTheme.dark ? "白天" : "夜间", dispatch,
                        icon: state.appTheme.dark
                            ? "assets/icon_night_sun.png"
                            : null),
                    buildTopItem(MyIcons.download, state, "离线", dispatch),
                    buildTopItem(MyIcons.recommend, state, "推荐", dispatch),
                  ],
                ),
              ),
            ],
          ),
          position: state.topAnimation,
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Stack(
              children: <Widget>[
                SlideTransition(
                    position: state.bottomAnimation,
                    child: BottomMenu<MenuState>(
                      state,
                      onTap: (val) {
                        dispatch(MenuActionCreator.menuItemClick(val));
                      },
                    )),
                Visibility(
                  visible: state.selectIndex == 1,
                  child: SlideTransition(
                      position: state.columnAnimation,
                      child: buildCategoryList(state, dispatch)),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              dispatch(MenuActionCreator.closeMenuAction());
            },
            child: Image.asset(
              state.selectIndex == 0
                  ? "assets/icon_close_button.png"
                  : "assets/icon_back_button.png",
              width: 60,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    ),
  );
}

Expanded buildTopItem(
    IconData iconData, MenuState menuState, String text, Dispatch dispatch,
    {String icon}) {
  return Expanded(
      child: GestureDetector(
    onTap: () {
      dispatch(MenuActionCreator.menuItemClick(text));
    },
    child: Column(
      children: <Widget>[
        icon == null
            ? Icon(
                iconData,
                size: 25,
              )
            : Image.asset(
                icon,
                width: 25,
              ),
        SizedBox(
          height: 5,
        ),
        TitleText(
          text,
          dark: menuState.appTheme.dark,
        )
      ],
    ),
  ));
}

Widget buildCategoryList(MenuState state, Dispatch dispatch) {
  return GridView.builder(
      itemCount: state.list == null ? 0 : state.list.length,
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 20.0,
          childAspectRatio: 0.4),
      itemBuilder: (BuildContext context, int index) {
        return _buildItemView(index, state, dispatch);
      });
}

Widget _buildItemView(int index, MenuState state, Dispatch dispatch) {
  Category category = state.list[index];
  return GestureDetector(
    onTap: () {
      dispatch(MenuActionCreator.onCategoryItemClick(index));
    },
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Image.network(
          state.appTheme.dark ? category.black_icon : category.white_icon,
          width: 40,
        ),
        SizedBox(
          width: 20,
        ),
       TitleText(
          category.title,
          dark: state.appTheme.dark,
        ),
      ],
    ),
  );
}
