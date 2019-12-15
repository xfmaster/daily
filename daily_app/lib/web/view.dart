import 'dart:io';

import 'package:daily_app/base/basic.dart';
import 'package:daily_app/view/loading_view.dart';
import 'package:daily_app/web/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'state.dart';
Widget buildView(WebState state, Dispatch dispatch, ViewService viewService) {
  return PlatformScaffold(
      backgroundColor: state.appTheme.backColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Builder(builder: (BuildContext context) {
            return WebView(
              userAgent: Platform.isIOS
                  ? "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36"
                  : "Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; HTC_D820u Build/KTU84P) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30",
              initialUrl: state.url,
              javascriptMode: JavascriptMode.unrestricted,
              ylistener: state.scrollYListener,
              onWebViewCreated: (WebViewController webViewController) {
                state.webViewController = webViewController;
              },
              // ignore: prefer_collection_literals
              javascriptChannels: <JavascriptChannel>[
                _toasterJavascriptChannel(context, dispatch)
              ].toSet(),
              onPageFinished: (String url) {
                dispatch(WebActionCreator.onLoadFinish());
                state.webViewController.evaluateJavascript(categoryJs);
                state.webViewController.evaluateJavascript(userJs);
                state.webViewController.evaluateJavascript(tagJs);
                state.webViewController.evaluateJavascript(relatedJs);
                if(state.appTheme.dark)
                state.webViewController.evaluateJavascript(_nightJs);
              },
            );
          }),
          SlideTransition(
            position: state.translateAnimation,
            child: viewService.buildComponent("toolBar"),
          ),
          Visibility(
            visible: state.loading ,
            child: LoadingView(
              isCustom: true,
              gifUrl: state.appTheme.dark
                  ? "assets/pageloading_night.gif"
                  : "assets/pen_pageloading.gif",
            ),
          )
        ],
      ));
}

final String categoryJs = 'javascript:(function(){'
    'var categoryEl= document.getElementsByClassName("category")[0];'
    'let data={};'
    'data.name=categoryEl.getElementsByTagName("span")[1].innerHTML;'
    'data.id=categoryEl.getAttribute("data-id");'
    'data.type="category";'
    'categoryEl.onclick=function()'
    '{WebViewJavascriptBridge.openNativePage("category",JSON.stringify(data, "utf-8"));}'
    '})()';
final String userJs = 'javascript:(function(){'
    'var authorEl= document.getElementsByClassName("author")[0];'
    'let data={};'
    'data.name=authorEl.getElementsByClassName("name")[0].innerHTML;'
    'data.id=authorEl.getAttribute("data-id");'
    'data.type="author";'
    'authorEl.onclick=function()'
    '{WebViewJavascriptBridge.openNativePage("author",JSON.stringify(data, "utf-8"));}'
    '})()';
final String tagJs =
    'javascript:(function(){var tagsEl= document.getElementsByClassName("tag");'
    'for(var i=0;i<tagsEl.length;i++){'
    'var tagEl=tagsEl[i];'
    'let data={};'
    'data.type="tag";'
    'data.id=tagEl.getAttribute("data-id");'
    'data.name=tagEl.getElementsByTagName("span")[0].innerHTML;'
    'tagEl.onclick=function(){'
    'WebViewJavascriptBridge.openNativePage("tag",JSON.stringify(data, "utf-8"));}'
    '};'
    '})()';

final String relatedJs = 'javascript:(function(){'
    'var relatedEl= document.getElementsByClassName("com-related-articles")[0];'
    'var items=relatedEl.getElementsByClassName("item");'
    'for(var i=0;i<items.length;i++){'
    'let data={};'
    'var itemEl=items[i];'
    'var a=itemEl.getElementsByTagName("a")[0];'
    'data.url=a.href;'
    'a.setAttribute("href", "javascript:void(0);");'
    'data.title=itemEl.getElementsByClassName("title")[0].innerHTML;'
    'data.category=itemEl.getElementsByClassName("sort")[0].innerHTML;'
    'var commentEl=itemEl.getElementsByClassName("comment-count")[0]; '
    'if(commentEl)data.commentCount=commentEl.innerHTML;'
    'data.type="related";'
    'var node=itemEl.getElementsByClassName("icon-toolbar-like")[0].nextSibling;'
    'while(node.nodeType != 1){'
    'node=node.nextSibling;'
    '}'
    'if(node)data.collectCount=node.innerHTML;'
    ' itemEl.onclick=function(){'
    'WebViewJavascriptBridge.openNativePage("related",JSON.stringify(data, "utf-8"));}'
    '};'
    '})();';
String _nightJs = 'javascript:(function(){'
    'document.getElementsByTagName("body")[0].className += "mode-night"; })();';

JavascriptChannel _toasterJavascriptChannel(
    BuildContext context, Dispatch dispatch) {
  return JavascriptChannel(
      name: 'WebViewJavascriptBridge',
      onMessageReceived: (JavascriptMessage message) {
        println(message.message);
        dispatch(WebActionCreator.webContentOnclick(message));
      });
}
