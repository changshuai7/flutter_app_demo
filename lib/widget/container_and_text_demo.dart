
//Container和Text组件2
import 'package:flutter/material.dart';

class ContainerAndTextHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //child对其方式为：居中
        alignment: Alignment.center,
        //外边距为12
        margin: EdgeInsets.only(top: 12),
        //内边距
        padding: EdgeInsets.fromLTRB(10, 10, 20, 20),
        //高度
        height: 300,
        //宽度
        width: 300,
        //配置装饰
        decoration: BoxDecoration(
          //容器背景颜色
            color: Colors.yellow,
            //设置圆角弧度
            borderRadius: BorderRadius.all(Radius.circular(50)),
            //设置边框样式
            border: Border.all(
                color: Colors.red, //边框颜色
                width: 2 //边框宽度
            )),
        //沿着Z轴旋转0.3
        transform: Matrix4.rotationZ(0.3),
        child: Text(
          "你好，中国你好，中国你好，中国你好，中国",
          //文字左对齐
          textAlign: TextAlign.start,
          //字体显示倍率：2倍
          textScaleFactor: 2,
          //文字最大显示行数为1行
          maxLines: 1,
          //文字超出屏幕以后，省略号处理
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            //字体大小10
              fontSize: 10,
              //文字装饰线：删除线
              decoration: TextDecoration.lineThrough,
              //文字装饰线颜色：红色是
              decorationColor: Colors.blue,
              //文字装饰线风格：两根实线
              decorationStyle: TextDecorationStyle.double,
              //文字样式:斜体
              fontStyle: FontStyle.italic,
              //字体粗细：加粗8倍
              fontWeight: FontWeight.w800,
              //文字间距变大5被
              letterSpacing: 5),
        ),
      ),
    );
  }
}