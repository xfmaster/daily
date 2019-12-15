import 'package:daily_app/base/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingView extends StatelessWidget {
  final String gifUrl;
  final bool isCustom;

  LoadingView(
      {this.gifUrl = "assets/pen_pageloading.gif", this.isCustom = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: AppTheme.getInstance().dark ? Color(0xff444444) : Colors.white,
      child: Center(
        child: !this.isCustom
            ? CupertinoActivityIndicator()
            : Image.asset(
                gifUrl,
                width: 200,
                height: 200,
              ),
      ),
    );
  }
}
