import 'package:flutter/material.dart';
import 'package:flutter_app_demo/share/provider/notify_model.dart';
import 'package:provider/provider.dart';


///
///
/// Consumer数据更新排除child
///
///
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('ProviderDemo'),
        ),
        body: ChangeNotifierProvider(
          create: (_) => Model1(),
          child: ContentWidget(),
        ),
      ),
    );
  }
}

class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('执行ContentWidget的build');
    return Column(
      children: [
        Consumer<Model1>(
          builder: (ctx, value, child) {
            print('执行Text更新');
            return ListTile(
              title: Text('主标题：${value.count}'),
              subtitle: child,
            );
          },
          child: MyText(),
        ),
        RaisedButton(
          child: Text('点击增加'),
          onPressed: () {
            context.read<Model1>().increase();
          },
        )
      ],
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('执行TextContent的build');
    return Text('我是副标题');
    //return Text('我是副标题：${context.watch<Model1>().count}');
  }
}
