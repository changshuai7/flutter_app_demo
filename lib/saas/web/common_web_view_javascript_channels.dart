import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

/// 公共 JavascriptChannels
Set<JavascriptChannel> commonJavascriptChannels(
    BuildContext context, Future<WebViewController> controller) {
  Set<JavascriptChannel> set = {};
  /// 展示一个Toast
  set.add(JavascriptChannel(
    name: 'show_toast',
    onMessageReceived: (JavascriptMessage message) {
      print('show_toast收到消息：${message.message}');
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(message.message)),
      );
    },
  ));

  /// 退出WebView
  set.add(JavascriptChannel(
      name: 'exit_web_view',
      onMessageReceived: (JavascriptMessage message) {
        print('exit_web_view收到消息：${message.message}');
        Navigator.of(context).pop();
      }));

  /// 登录过期
  set.add(JavascriptChannel(
      name: 'token_expired',
      onMessageReceived: (JavascriptMessage message) {
        print('token_expired收到消息：${message.message}');
      }));
  return set;
}
