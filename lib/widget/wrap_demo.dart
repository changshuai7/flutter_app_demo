import 'package:flutter/material.dart';

class WrapDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 300,
        color: Colors.amber,
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.end,
          runAlignment: WrapAlignment.center,
          verticalDirection: VerticalDirection.up,
          children: [
            Btn('1小红'),
            Btn('2小兰'),
            Btn('3好厉害'),
            Btn('4我'),
            Btn('5程序员'),
            Btn('6程序媛'),
            Btn('7哈哈'),
            Btn('8美丽的祖国'),
            Btn('9中国'),
          ],
        ),
      ),
    );
  }
}

class Btn extends StatelessWidget {
  final String text;

  Btn(this.text);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(text),
      textColor: Colors.white,
      onPressed: () {},
    );
  }
}
