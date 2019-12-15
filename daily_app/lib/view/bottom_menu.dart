import 'package:daily_app/common/icons.dart';
import 'package:daily_app/global_store/state.dart';
import 'package:daily_app/home/menu/state.dart';
import 'package:daily_app/view/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomMenu<T extends GlobalBaseState> extends StatefulWidget {
  final T state;
  final Function onTap;

  BottomMenu(this.state, {this.onTap});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomMenuState();
  }
}

class BottomMenuState extends State<BottomMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildItem(
          widget.state,
          MyIcons.about,
          "关于我们",
        ),
        buildItem(widget.state, MyIcons.categories, "新闻分类", showArrow: true),
        buildItem(widget.state, MyIcons.column, "栏目中心"),
        buildItem(widget.state, MyIcons.msg, "我的消息"),
        buildItem(widget.state, MyIcons.user_center, "个人中心"),
        buildItem(widget.state, MyIcons.question, "意见反馈"),
      ],
    );
  }

  Widget buildItem(MenuState state, IconData iconData, String text,
      {bool showArrow}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (widget.onTap != null) widget.onTap(text);
        },
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: state.appTheme.backColor),
              child: Icon(iconData),
            ),
            SizedBox(
              width: 20,
            ),
            TitleText(
              text,
              dark: state.appTheme.dark,
            ),
            SizedBox(
              width: 5,
            ),
            showArrow != null && showArrow == true
                ? Icon(MyIcons.rightArrow,size: 18,)
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
