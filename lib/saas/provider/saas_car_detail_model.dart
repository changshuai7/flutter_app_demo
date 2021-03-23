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

  @JsonKey(name: 'title')
  String title; //标题

  @JsonKey(name: 'city')
  String city; //城市

  @JsonKey(name: 'show_price')
  String showPrice; //展厅价

  @JsonKey(name: 'display_price')
  String displayPrice; //人人车标价

  @JsonKey(name: 'show_status')
  String showStatus; //展示状态

  @JsonKey(name: 'trade_status')
  String tradeStatus; //交易状态

  @JsonKey(name: 'inspector_name')
  String inspectorName; //归属评估

  @JsonKey(name: 'sale_name')
  String saleName; //归属销售

  @JsonKey(name: 'own_vehicle_id')
  String ownVehicleId; //车车号

  @JsonKey(name: 'rrc_id')
  String rrcId; //车源编号

  @JsonKey(name: 'is_contact_owner')
  bool isContactOwner; //是否能够联系车主

  @JsonKey(name: 'mileage')
  String mileage; //行程里数

  @JsonKey(name: 'first_licensed_date')
  String firstLicensedDate; //首次上牌时间

  @JsonKey(name: 'transfer_times')
  String transferTimes; //过户次数

  @JsonKey(name: 'license_city')
  String licenseCity; //上牌城市

  @JsonKey(name: 'displacement')
  String displacement; //排量

  @JsonKey(name: 'delivery_time')
  String deliveryTime; //出厂时间

  @JsonKey(name: 'transport_test_expire')
  String transportTestExpire; //年检到期时间

  @JsonKey(name: 'compulsory_insurance_expire')
  String compulsoryInsuranceExpire; //强险到期时间

  void update() {
    notifyListeners();
  }

  CarDetailBean({
    this.selfCarImage = const [],
    this.auditStatus = '',
    this.sourceTags = const [],
    this.title = '',
    this.city = '',
    this.showPrice = '',
    this.displayPrice = '',
    this.showStatus = '',
    this.tradeStatus = '',
    this.inspectorName = '',
    this.saleName = '',
    this.ownVehicleId = '',
    this.rrcId = '',
    this.isContactOwner = false,
    this.mileage = '',
    this.firstLicensedDate = '',
    this.transferTimes = '',
    this.licenseCity = '',
    this.displacement = '',
    this.deliveryTime = '',
    this.transportTestExpire = '',
    this.compulsoryInsuranceExpire = '',
  });

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
