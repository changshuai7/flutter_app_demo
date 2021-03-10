import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        children: [
          Btn(
            'DateTime的方法',
            onPress: () {
              var dt = DateTime(2020, 1, 2, 14, 30, 20, 123, 456);
              print('$dt');

              var now = DateTime.now();
              print('$now');
              print('${now.microsecondsSinceEpoch}');
              print('${DateTime.fromMicrosecondsSinceEpoch(1615357659583950)}');
              print('${DateTime.parse('2021-03-10').runtimeType}');
              print('${now.isBefore(DateTime.parse('2030-01-01'))}');
              print('${now.isAfter(DateTime.parse('2030-01-01'))}');
              var t1 = DateTime.parse('2030-01-01');
              var t2 = DateTime.parse('2020-01-01');
              print('${t1.isAtSameMomentAs(t1)}');
              print('${t1.isAtSameMomentAs(t2)}');
              print('${t1.compareTo(t2)}');
              print('${t1.compareTo(t1)}');
              print('$now');
              print('${now.add(Duration(days: 1, hours: 2, minutes: 20))}');
              print('$now');
              print(
                  '${now.subtract(Duration(days: 1, hours: 2, minutes: 20))}');

              var t_1 = DateTime.parse('2021-01-01 10:11:12');
              var t_2 = DateTime.parse('2020-01-02');
              print('${t_1.difference(t_2)}');
              print('${t_2.difference(t_1)}');

              print('${now.timeZoneName}');

              print('${now.timeZoneOffset}');

              print('年:${now.year}\n'
                  '月:${now.month}\n'
                  '日:${now.day}\n'
                  '时:${now.hour}\n'
                  '分:${now.minute}\n'
                  '秒:${now.second}\n'
                  '毫秒:${now.millisecond}\n'
                  '微秒:${now.microsecond}\n');

              print('${DateTime.parse('2020-03-15').weekday}');
            },
          ),
          Btn(
            'date_format方法',
            onPress: () {
              print(formatDate(DateTime.now(), [yyyy, '-', m, '-', d]));
              print(formatDate(DateTime(2018, 1, 14), [yyyy, '/', M, '/', D]));
            },
          )
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
