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
