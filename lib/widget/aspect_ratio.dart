import 'package:flutter/material.dart';

class AspectRadioDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.red,
      child: AspectRatio(
        aspectRatio: 1.0 / 0.5,
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}


class AspectRadioDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: AspectRatio(
        aspectRatio: 1.0 / 0.5,
        child: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
