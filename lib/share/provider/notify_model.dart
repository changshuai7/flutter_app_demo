import 'package:flutter/material.dart';

class Model1 extends ChangeNotifier {
  int _count = 0; //需要设置初始化值

  int get count => _count;

  void increase() {
    _count++;
    notifyListeners();
  }
}

class Model2 extends ChangeNotifier {
  String _title = '';
  String _subTitle = '';

  String get title => _title;

  String get subTitle => _subTitle;

  void setSubTitle(String value) {
    this._subTitle = value;
    notifyListeners();
  }

  void setTitle(String value) {
    this._title = value;
    notifyListeners();
  }
}

class GoodsModel extends ChangeNotifier {
  List<Goods> _goodsList =
      List.generate(10, (index) => Goods('GoodsName_$index', false));

  get goodsList => _goodsList;

  get length => goodsList.length;

  //添加商品到购物车
  void addGoodsToCart(int index) {
    Goods g = goodsList[index];
    if (!g.isSelected) {
      //如果商品未添加到购物车，则添加
      goodsList[index] = Goods(g.name, !g.isSelected);
      notifyListeners();
    }
  }
}

class Goods {
  String name; // 商品名称
  bool isSelected; // 商品是否加入了购物车

  Goods(this.name, this.isSelected);
}
