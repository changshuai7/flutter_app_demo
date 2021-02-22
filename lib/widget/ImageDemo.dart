//远程图片
import 'package:flutter/material.dart';

class ImageHomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageUrl =
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577359381804&di=bf467cdc5e6d366825a59ab4c1edc2bb&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D2348394515%2C2895775719%26fm%3D214%26gp%3D0.jpg";
    var imageUrl2 =
        "http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg";
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
    var imageUrl =
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577359381804&di=bf467cdc5e6d366825a59ab4c1edc2bb&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D2348394515%2C2895775719%26fm%3D214%26gp%3D0.jpg";
    var imageUrl2 =
        "http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg";
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
    var imageUrl =
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577359381804&di=bf467cdc5e6d366825a59ab4c1edc2bb&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D2348394515%2C2895775719%26fm%3D214%26gp%3D0.jpg";
    var imageUrl2 =
        "http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg";
    var imageUrl3 =
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577958971&di=dbdc9d5c67a9de5afa16588d590a9e61&imgtype=jpg&er=1&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fbaike%2Fcrop%253D0%252C68%252C190%252C270%253Bw%253D138%253Bq%253D95%2Fsign%3D1a6070f50bfa513d45e5369e005d79cd%2Fb7003af33a87e950bec5164513385343faf2b4cd.jpg";
    return Center(
      //建议把图片放在一个Container中，可以控制图片的显示位置、方式等。
      child: Container(
        child: ClipOval(
          child: Image.network(
            imageUrl3,
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

