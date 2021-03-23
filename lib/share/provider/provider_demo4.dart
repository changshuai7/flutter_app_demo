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
            print('执行builder');
            return Column(
              children: [
                Text('${value.count}'),
                child,
              ],
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
    print('执行MyText的build');
    return Text('MyText');
    // return Text('${context.watch<Model1>().count}');
  }
}
