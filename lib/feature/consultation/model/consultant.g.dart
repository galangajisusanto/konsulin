// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Consultant _$ConsultantFromJson(Map<String, dynamic> json) {
  return Consultant(
    name: json['name'] as String,
    profession: json['profession'] as String,
    expertise: json['expertise'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$ConsultantToJson(Consultant instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profession': instance.profession,
      'expertise': instance.expertise,
      'imageUrl': instance.imageUrl,
    };
