//@dart=2.12

import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'saas_car_detail_model.g.dart';

@JsonSerializable()
class CarDetailBean extends ChangeNotifier {
  @JsonKey(name: 'self_car_image')
  List<SelfCarImageBean> selfCarImage; //车身图片轮播

  @JsonKey(name: 'audit_status')
  String auditStatus; //审核状态String

  @JsonKey(name: 'source')
  List<String> sourceTags; //tag标签

  void update() {
    notifyListeners();
  }

  CarDetailBean(
      {this.selfCarImage = const [],
      this.auditStatus = '',
      this.sourceTags = const []});

  ////////////////// fromJson & toJson //////////////////

  factory CarDetailBean.fromJson(Map<String, dynamic> json) =>
      _$CarDetailBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CarDetailBeanToJson(this);
}

@JsonSerializable()
class SelfCarImageBean {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'value')
  List<String> value;

  SelfCarImageBean(this.name, this.value);

  ////////////////// fromJson & toJson //////////////////

  factory SelfCarImageBean.fromJson(Map<String, dynamic> json) =>
      _$SelfCarImageBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SelfCarImageBeanToJson(this);
}
