import 'dart:ui';

import 'package:daily_app/bean/news_bean.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:webview_flutter/webview_flutter.dart';

//TODO replace with your own action
enum WebAction {
  changeColorAlpha,
  onLoadFinish,
  webContentOnclick,
  updateInfoAction,
  updateUrlAction
}

class WebActionCreator {
  static Action changeColorAlpha(int alpha) {
    return Action(WebAction.changeColorAlpha, payload: alpha);
  }
  static Action updateUrlAction(String url) {
    return Action(WebAction.updateUrlAction, payload: url);
  }

  static Action updateInfoAction(NewsBean newsBean) {
    return Action(WebAction.updateInfoAction, payload: newsBean);
  }

  static Action onLoadFinish() {
    return Action(WebAction.onLoadFinish);
  }

  static Action webContentOnclick(JavascriptMessage message) {
    return Action(WebAction.webContentOnclick, payload: message);
  }
}
