import 'package:flutter/material.dart';

//Stack简单使用
class StackDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.green,
            ),
            Container(
              width: 70,
              height: 70,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}

//fit属性使用
class StackDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
        child: Stack(
          alignment: Alignment(0, 0),
          fit: StackFit.expand,
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.red,
            ),
            Container(
              width: 70,
              height: 70,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}

//Align组件
class StackDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
        child: Stack(
          //此时Stack下的alignment的属性仅对未定位或者部分定位的Widget有效
          alignment: Alignment.topRight,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 80,
                height: 80,
                color: Colors.red,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 70,
                height: 70,
                color: Colors.yellow,
              ),
            ),
            //Stack下的alignment的属性，对此未定位的此Widget有效
            Container(
              width: 60,
              height: 60,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

//Position属性
class StackDemo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
        child: Stack(
          //此时Stack下的alignment的属性仅对未定位的或者部分定位的Widget有效
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 20,
              left: 20,
              child: Container(
                width: 80,
                height: 80,
                color: Colors.red,
              ),
            ),
            Positioned(
              right: 20,
              top: 20,
              child: Container(
                width: 70,
                height: 70,
                color: Colors.yellow,
              ),
            ),
            //Stack下的alignment的属性，对此未定位的此Widget有效
            Container(
              width: 60,
              height: 60,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

//部分定位
class StackDemo5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
        child: Stack(
          //此时Stack下的alignment的属性仅对未定位的或者部分定位的Widget有效
          alignment: Alignment.topLeft,
          children: [
            Positioned(
              bottom: 20,
              left: 20,
              child: Container(
                width: 80,
                height: 80,
                color: Colors.red,
              ),
            ),
            //Stack下的alignment的属性，对此部分定位的此Widget有效
            Positioned(
              right: 20, //y轴方向未定位，此组件为部分定位
              child: Container(
                width: 70,
                height: 70,
                color: Colors.yellow,
              ),
            ),
            //Stack下的alignment的属性，对此未定位的此Widget有效
            Container(
              width: 60,
              height: 60,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
