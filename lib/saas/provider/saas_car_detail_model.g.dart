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
    showPrice: json['show_price'] as String,
    displayPrice: json['display_price'] as String,
    showStatus: json['show_status'] as String,
    tradeStatus: json['trade_status'] as String,
    inspectorName: json['inspector_name'] as String,
    saleName: json['sale_name'] as String,
    ownVehicleId: json['own_vehicle_id'] as String,
    rrcId: json['rrc_id'] as String,
    isContactOwner: json['is_contact_owner'] as bool,
    mileage: json['mileage'] as String,
    firstLicensedDate: json['first_licensed_date'] as String,
    transferTimes: json['transfer_times'] as String,
    licenseCity: json['license_city'] as String,
    displacement: json['displacement'] as String,
    deliveryTime: json['delivery_time'] as String,
    transportTestExpire: json['transport_test_expire'] as String,
    compulsoryInsuranceExpire: json['compulsory_insurance_expire'] as String,
    vehicleConditionDescription:
        json['vehicle_condition_description'] as String,
    tags: (json['tag'] as List<dynamic>)
        .map((e) => TagBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CarDetailBeanToJson(CarDetailBean instance) =>
    <String, dynamic>{
      'self_car_image': instance.selfCarImage,
      'audit_status': instance.auditStatus,
      'source': instance.sourceTags,
      'title': instance.title,
      'city': instance.city,
      'show_price': instance.showPrice,
      'display_price': instance.displayPrice,
      'show_status': instance.showStatus,
      'trade_status': instance.tradeStatus,
      'inspector_name': instance.inspectorName,
      'sale_name': instance.saleName,
      'own_vehicle_id': instance.ownVehicleId,
      'rrc_id': instance.rrcId,
      'is_contact_owner': instance.isContactOwner,
      'mileage': instance.mileage,
      'first_licensed_date': instance.firstLicensedDate,
      'transfer_times': instance.transferTimes,
      'license_city': instance.licenseCity,
      'displacement': instance.displacement,
      'delivery_time': instance.deliveryTime,
      'transport_test_expire': instance.transportTestExpire,
      'compulsory_insurance_expire': instance.compulsoryInsuranceExpire,
      'vehicle_condition_description': instance.vehicleConditionDescription,
      'tag': instance.tags,
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

TagBean _$TagBeanFromJson(Map<String, dynamic> json) {
  return TagBean(
    json['id'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$TagBeanToJson(TagBean instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
