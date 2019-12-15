import 'package:daily_app/base/app_theme.dart';
import 'package:daily_app/home/index/banner/banner_state.dart';
import 'package:daily_app/view/text.dart';
import 'package:daily_app/view/ui.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'action.dart';

Widget buildView(
    BannerItemState state, Dispatch dispatch, ViewService viewService) {
  var theme = AppTheme.getInstance();
  return state.bean == null
      ? SizedBox(
          height: 240,
        )
      : SizedBox(
          height: 240,
          child: Swiper(
              itemCount: state.bean == null ? 0 : state.bean.length,
              scrollDirection: Axis.horizontal,
              autoplay: true,
              itemHeight: 240,
              containerHeight: 240,
              onTap: (int index) {
                dispatch(BannerActionCreator.onTapAction(index));
              },
              pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.grey,
                      activeColor: Colors.yellowAccent,
                      size: 8,
                      activeSize: 8)),
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    buildImage(state.bean[index].image,
                        width: MediaQuery.of(context).size.width,
                        height: 240.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40, left: 20, right: 20),
                      child: TitleText(
                        state.bean[index].post.title,
                        maxLines: 2,
                        textSize: theme.textSize,
                        style: TextStyle(
                            color: Colors.white, fontSize: theme.mainTextSize),
                      ),
                    ),
                  ],
                );
              }),
        );
}
