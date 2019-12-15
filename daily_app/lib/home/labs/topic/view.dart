import 'package:daily_app/home/labs/topic/state.dart';
import 'package:daily_app/view/text.dart';
import 'package:daily_app/view/ui.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(TopicItemState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    height: 150,
    margin: EdgeInsets.only(top: 5),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: state.bean.topics
            .map((bean) => Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: buildImage(bean.image),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TitleText(
                          bean.title,
                          color: Colors.white,
                        ),
                        SubTitleText(
                          bean.description,
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ))
            .toList(),
      ),
    ),
  );
}
