import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

const interceptStr = 'rrc://renrenaiche.cn/?params=';

/// 公共 JavascriptChannels 拦截
NavigationDecision commonNavigationDelegate(BuildContext context,NavigationRequest request) {
  if (request.url.startsWith(interceptStr)) {
    String url = request.url;
    int last = url.lastIndexOf(interceptStr);
    String lastStr = url.substring(last + interceptStr.length);
    print('拦截到的数据为：${Uri.decodeComponent(lastStr)}');

    return NavigationDecision.prevent; //拦截
  }

  return NavigationDecision.navigate; //不拦截
}
