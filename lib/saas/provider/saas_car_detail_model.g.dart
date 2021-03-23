// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'saas_car_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDetailBean _$CarDetailBeanFromJson(Map<String, dynamic> json) {
  return CarDetailBean(
    selfCarImage: (json['self_car_image'] as List<dynamic>)
        .map((e) => SelfCarImageBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    auditStatus: json['audit_status'] as String,
    sourceTags:
        (json['source'] as List<dynamic>).map((e) => e as String).toList(),
    title: json['title'] as String,
    city: json['city'] as String,
  );
}

Map<String, dynamic> _$CarDetailBeanToJson(CarDetailBean instance) =>
    <String, dynamic>{
      'self_car_image': instance.selfCarImage,
      'audit_status': instance.auditStatus,
      'source': instance.sourceTags,
      'title': instance.title,
      'city': instance.city,
    };

SelfCarImageBean _$SelfCarImageBeanFromJson(Map<String, dynamic> json) {
  return SelfCarImageBean(
    json['name'] as String,
    (json['value'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$SelfCarImageBeanToJson(SelfCarImageBean instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
