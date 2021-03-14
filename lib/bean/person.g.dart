// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
    json['name'] as String,
    json['age'] as int,
    (json['phone'] as List<dynamic>)
        .map((e) => Phone.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'phone': instance.phone,
    };

Phone _$PhoneFromJson(Map<String, dynamic> json) {
  return Phone(
    json['huawei'] as String,
    json['xiaomi'] as String,
  );
}

Map<String, dynamic> _$PhoneToJson(Phone instance) => <String, dynamic>{
      'huawei': instance.huawei,
      'xiaomi': instance.xiaomi,
    };
