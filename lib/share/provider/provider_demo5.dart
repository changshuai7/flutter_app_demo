import 'package:flutter/material.dart';
import 'package:flutter_app_demo/share/provider/notify_model.dart';
import 'package:provider/provider.dart';

///
///
/// Consumer数据更新排除child
/// child存在数据更新
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
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Model1()),
            ChangeNotifierProvider(create: (_) => Model2()),
          ],
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
                MyText(),
                child,
              ],
            );
          },
          child: MyListTile(),
        ),
        RaisedButton(
          child: Text('点击增加'),
          onPressed: () {
            context.read<Model1>().increase();
            context.read<Model2>().setTitle('主标题：${DateTime.now()}');
            context.read<Model2>().setSubTitle('副标题：${DateTime.now()}');
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
  }
}

class MyListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('执行MyListTile的build');

    // return ListTile(
    //   title: Text('主标题'),
    //   subtitle: Text('副标题'),
    // );
    //
    // return ListTile(
    //   title: Text('${context.watch<Model2>().title}'),
    //   subtitle: Text('${context.watch<Model2>().subTitle}'),
    // );

    return Consumer<Model2>(
      builder: (_, value, child) => ListTile(
        title: Text('${value.title}'),
        subtitle: Text('${value.subTitle}'),
      ),
    );
  }
}
