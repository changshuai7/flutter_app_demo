import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'common_web_view_javascript_channels.dart';
import 'common_web_view_navigation_delegate.dart';

///通用WebView封装
class CommonWebView extends StatefulWidget {
  final String initialUrl;
  final bool displayAppBar;
  final NavigationDecision Function(
      BuildContext context, NavigationRequest request) navigationDelegate;

  final Set<JavascriptChannel> Function(
      BuildContext context, Future<WebViewController>) javascriptChannels;

  CommonWebView(
    this.initialUrl, //初始化地址
    {
    this.displayAppBar = true, //是否展示AppBar
    this.javascriptChannels, //调用Flutter协议
    this.navigationDelegate, //Flutter拦截
  });

  @override
  _CommonWebViewState createState() => _CommonWebViewState();
}

class _CommonWebViewState extends State<CommonWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  double _loadProgress = 0.0; //加载进度
  String _title = ''; //H5标题

  /// 进度条
  Widget _progressBar(double progress, BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 2,
      backgroundColor: Colors.white70.withOpacity(0),
      value: progress == 1.0 ? 0 : progress,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
    );
  }

  /// JSChannel
  Set<JavascriptChannel> _javascriptChannels(BuildContext context) {
    // 添加公共部分
    Set<JavascriptChannel> set =
        commonJavascriptChannels(context, _controller.future);
    // 添加用户自定义部分
    if (widget.javascriptChannels != null) {
      set.addAll(widget.javascriptChannels(context, _controller.future));
    }
    return set;
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          appBar: widget.displayAppBar
              ? AppBar(
                  title: Text(_title),
                  bottom: PreferredSize(
                    child: _progressBar(_loadProgress, context),
                    preferredSize: Size.fromHeight(3.0),
                  ),
                  actions: <Widget>[
                    MoreMenu(_controller.future),
                  ],
                )
              : null,
          body: Builder(
            builder: (BuildContext context) {
              return WebView(
                initialUrl: widget.initialUrl,
                javascriptMode: JavascriptMode.unrestricted,

                /// WebView创建成功
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },

                /// 进度控制
                onProgress: (int progress) {
                  setState(() {
                    this._loadProgress = progress / 100;
                  });
                },

                /// JS->调用Flutter
                javascriptChannels: _javascriptChannels(context),

                /// URL->拦截（添加URL拦截会导致WebView无限重定向，无法正确回退，此处屏蔽）
                // navigationDelegate: (NavigationRequest request) {
                //   if (commonNavigationDelegate(context, request) ==
                //       NavigationDecision.prevent) {
                //     return NavigationDecision.prevent;
                //   }
                //
                //   if (widget.navigationDelegate != null &&
                //       widget.navigationDelegate(context, request) ==
                //           NavigationDecision.prevent) {
                //     return NavigationDecision.prevent;
                //   }
                //   return NavigationDecision.navigate;
                // },

                /// Page - Start
                onPageStarted: (String url) {},

                /// Page - Finished
                onPageFinished: (String url) {
                  setState(() async {
                    var con = await _controller.future;
                    con.evaluateJavascript('document.title').then((t) {
                      setState(() {
                        //很奇怪，返回的title数据包裹了""，所以这里只能去掉收尾的双引号
                        if (t.startsWith('\"') && t.endsWith('\"')) {
                          this._title = t.substring(1, t.length - 1);
                        }
                      });
                    });
                  });
                },
              );
            },
          )),

      /// 拦截返回按键
      /// 该回调需要返回一个Future对象
      /// 如果返回的Future最终值为false时，则当前路由不出栈(不会返回)；
      /// 最终值为true时，当前路由出栈退出。我们需要提供这个回调来决定是否退出。
      onWillPop: () async {
        var con = await _controller.future;
        var canGoBack = await con.canGoBack();
        if (canGoBack) {
          await con.goBack();
          return false;
        } else {
          Navigator.of(context).maybePop(); //WebView退出
          return true;
        }
      },
    );
  }
}

enum MenuOptions {
  refresh,
  loadTestRes,
  exit,
}

class MoreMenu extends StatelessWidget {
  MoreMenu(this.controller);

  final Future<WebViewController> controller;
  final CookieManager cookieManager = CookieManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: controller,
      builder: (BuildContext context,
          AsyncSnapshot<WebViewController> controllerSnapshot) {
        final bool webViewReady =
            controllerSnapshot.connectionState == ConnectionState.done;
        return PopupMenuButton<MenuOptions>(
          onSelected: (MenuOptions value) {
            switch (value) {

              /// 刷新
              case MenuOptions.refresh:
                if (webViewReady) {
                  controllerSnapshot.data.reload();
                }
                break;

              /// 加载本地资源
              case MenuOptions.loadTestRes:
                if (webViewReady) {
                  _loadHtmlFromAssets(controllerSnapshot.data);
                }
                break;

              /// 退出WebView
              case MenuOptions.exit:
                Navigator.of(context).maybePop();
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<MenuOptions>>[
            PopupMenuItem<MenuOptions>(
              value: MenuOptions.refresh,
              child: const Text('刷新'),
              enabled: controllerSnapshot.hasData,
            ),
            !bool.fromEnvironment("dart.vm.product")
                ? PopupMenuItem<MenuOptions>(
                    value: MenuOptions.loadTestRes,
                    child: Text('测试HTML'),
                  )
                : null,
            PopupMenuItem<MenuOptions>(
              value: MenuOptions.exit,
              child: Text('关闭'),
            ),
          ],
        );
      },
    );
  }

  //加载本地资源
  _loadHtmlFromAssets(WebViewController controller) async {
    // 注意：需要在yaml中声明flutter_js.html的资源路径：
    // assets:
    //   - lib/saas/web/res/
    String fileHtmlContents =
        await rootBundle.loadString('lib/saas/web/res/flutter_js.html');
    controller.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
