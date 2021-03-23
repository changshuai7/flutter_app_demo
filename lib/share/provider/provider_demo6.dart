import 'package:flutter/material.dart';
import 'package:flutter_app_demo/share/provider/notify_model.dart';
import 'package:provider/provider.dart';

///
///
/// Select实现购物车功能
///
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
        body: ChangeNotifierProvider(
          create: (_) => GoodsModel(),
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
    return ListView.builder(
      itemCount: context.read<GoodsModel>().length,
      itemBuilder: (BuildContext context, int index) {
        return Selector<GoodsModel, Goods>(
          selector: (BuildContext context, GoodsModel goodsModel) {
            return goodsModel.goodsList[index];
          },
          builder: (BuildContext context, Goods goods, Widget child) {
            print("build item $index");
            return ListTile(
              title: Text(goods.name),
              subtitle: Text(
                goods.isSelected ? "已加入购物车" : '点击加入购物车',
                style: TextStyle(
                  color: goods.isSelected ? Colors.red : Colors.black,
                ),
              ),
              onTap: () {
                context.read<GoodsModel>().addGoodsToCart(index);
              },
            );
          },
        );
      },
    );
  }
}
