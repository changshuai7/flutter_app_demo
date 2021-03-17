import 'package:flutter/material.dart';

void main() {
  runApp(TestWidget());
}

//用于共享数据的InheritedWidget
class ShareDataInheritedWidget extends InheritedWidget {
  final int data;

  ShareDataInheritedWidget({this.data, Widget child}) : super(child: child);

  static ShareDataInheritedWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ShareDataInheritedWidget>();

    // return context
    //     .getElementForInheritedWidgetOfExactType<ShareDataInheritedWidget>()
    //     .widget;
  }

  @override
  bool updateShouldNotify(covariant ShareDataInheritedWidget oldWidget) {
    print('执行：updateShouldNotify');
    return oldWidget.data != this.data;
  }
}

class SonWidget extends StatefulWidget {
  @override
  _SonWidgetState createState() => _SonWidgetState();
}

class _SonWidgetState extends State<SonWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataInheritedWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('执行：SonWidget中的didChangeDependencies');
  }
}

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('InheritedDemo'),
        ),
        body: Center(
          child: ShareDataInheritedWidget(
            data: count,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    child: Text('点击增加'),
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    }),
                SonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
