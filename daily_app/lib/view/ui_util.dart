import 'package:daily_app/base/basic.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'loading_dialog.dart';

class UIUtil {
  static void showCusDialog(BuildContext context, call, title, content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PlatformAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  call(true);
                },
                child: Text("确定"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  call(false);
                },
                child: Text("取消"),
              ),
            ],
          );
        });
  }

  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  static void showLoadingDialog(BuildContext context, {String text}) {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            //调用对话框
            text: text ??= '加载中...',
          );
        });
  }

  static void stopLoadingDialog(BuildContext context) {
    Navigator.pop(context); //关闭对话框
  }
}
