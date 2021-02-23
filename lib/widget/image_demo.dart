//远程图片
import 'package:flutter/material.dart';

class ImageHomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageUrl =
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2207136865,1222916190&fm=26&gp=0.jpg';
    return Center(
      //建议把图片放在一个Container中，可以控制图片的显示位置、方式等。
      child: Container(
        //注意这里虽然width、height是一个bool类型，但是可以不用输入.0
        width: 300, //设置宽度
        height: 500, //设置高度
        decoration: BoxDecoration(
            color: Colors.yellow, //容器背景颜色
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            )),
        //图片作为子组件
        child: Image.network(
          //加载远程图片
          imageUrl,
          alignment: Alignment.topLeft,
          repeat: ImageRepeat.repeat,
        ),
      ),
    );
  }
}

//圆角图片
class ImageHomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageUrl = 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2207136865,1222916190&fm=26&gp=0.jpg';
    return Center(
      //建议把图片放在一个Container中，可以控制图片的显示位置、方式等。
      child: Container(
        //注意这里虽然width、height是一个bool类型，但是可以不用输入.0
        width: 300, //设置宽度
        height: 300, //设置高度
        decoration: BoxDecoration(
            color: Colors.yellow, //容器背景颜色
            //如下两种方式都可以配置圆形的容器
            // borderRadius: BorderRadius.all(Radius.circular(150)),
            borderRadius: BorderRadius.circular(150),
            image: DecorationImage(
              //  image: Image.network(src)//注意这里使用Image.network会报错
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            )),
      ),
    );
  }
}

//圆角图片2
class ImageHomeContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageUrl = 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2207136865,1222916190&fm=26&gp=0.jpg';
    return Center(
      //建议把图片放在一个Container中，可以控制图片的显示位置、方式等。
      child: Container(
        child: ClipOval(
          child: Image.network(
            imageUrl,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

//加载本地图片
class ImageHomeContent4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset('images/2.0x/a.png'),
        height: 300,
        width: 300,
      ),
    );
  }
}

