import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; //国际化

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
          title: Text("DateTimePicker"),
        ),
        body: SystemDateTimePickerDemo(),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
    );
  }
}

class SystemDateTimePickerDemo extends StatefulWidget {
  @override
  _SystemDateTimePickerDemoState createState() =>
      _SystemDateTimePickerDemoState();
}

class _SystemDateTimePickerDemoState extends State<SystemDateTimePickerDemo> {
  String dateResult;
  String timeResult;

  //调起日期选择器方式2
  _showDatePicker1() async {
    var result = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    setState(() {
      dateResult = result?.toString();
    });
  }

  //调起日期选择器
  _showDatePicker() {
    showDatePicker(
      // initialEntryMode: DatePickerEntryMode.calendar,
      // initialDatePickerMode: DatePickerMode.day,
      // builder: (BuildContext context, Widget child) {
      //   return Theme(
      //     data: ThemeData.dark(),
      //     child: child,
      //   );
      // },
      // helpText: 'HelloWorld',
      // confirmText: 'My-Confirm',
      // cancelText: 'My-Cancel',
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      //locale: Locale('zh'),
      selectableDayPredicate: (DateTime day) {
        return day.difference(DateTime.now()).inDays < 2;
      },
    ).then((result) {
      setState(() {
        dateResult = result?.toString();
      });
    });
  }

  //调起时间选择器
  _showTimePicker() {
    showTimePicker(
      // initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((result) {
      setState(() {
        this.timeResult = result?.format(context)?.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        children: [
          Btn(
            '日期选择器',
            onPress: _showDatePicker,
          ),
          Text('日期选择器的结果为：${this.dateResult ?? '未选择'}'),
          Btn(
            '时间选择器',
            onPress: _showTimePicker,
          ),
          Text('时间选择器的结果为：${this.timeResult ?? '未选择'}'),
        ],
      ),
    );
  }
}

class Btn extends StatelessWidget {
  final onPress;
  final String text;

  Btn(this.text, {this.onPress});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(
          this.text,
          textAlign: TextAlign.center,
        ),
        color: Theme.of(context).accentColor,
        colorBrightness: Brightness.dark,
        onPressed: this.onPress);
  }
}
