// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sme _$SmeFromJson(Map<String, dynamic> json) {
  return Sme(
    name: json['name'] as String,
    address: json['address'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$SmeToJson(Sme instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
    };
