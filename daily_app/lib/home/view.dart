import 'package:daily_app/base/basic.dart';
import 'package:daily_app/global_store/action.dart';
import 'package:daily_app/global_store/store.dart';
import 'package:daily_app/route/route_manager.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  return PlatformScaffold(
    floatingActionButton: Visibility(
      child: Container(
        height: 50,
        width: 50,
        child: FloatingActionButton(
          onPressed: () {
//        GlobalStore.store
//            .dispatch(GlobalActionCreator.onchangeThemeColor(true));
            dispatch(HomeActionCreator.showMenuAction());
          },
          backgroundColor: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/icon_more.png'),
          ),
        ),
      ),
      visible: state.hide,
    ),
    body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverOverlapAbsorber(
            handle:
            NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            child:SliverAppBar(
              pinned: false,
              expandedHeight: 30.0,
              backgroundColor: state.appTheme.backColor,
              bottom: PreferredSize(
                  child: new TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.yellowAccent,
                    labelColor: state.appTheme.textColor,
                    unselectedLabelColor: Colors.grey,
                    controller: state.tabController,
                    tabs: [
                      new Tab(
                        child: Text(
                          'NEWS',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      new Tab(
                        child: Text(
                          'LABS',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  preferredSize: new Size(double.infinity, 0.0)),
              flexibleSpace: new Container(child: SizedBox()),
            ) ,
          )
        ];
      },
      controller: state.controller,
      body: TabBarView(
        controller: state.tabController,
        children: <Widget>[
          routes.buildPage("index",null),
          routes.buildPage("labs", null),
        ],
      ),
    ),
  );
}
