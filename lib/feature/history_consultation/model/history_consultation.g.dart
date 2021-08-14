// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_consultation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationHistory _$ConsultationHistoryFromJson(Map<String, dynamic> json) {
  return ConsultationHistory(
    name: json['name'] as String,
    expertise: json['expertise'] as String,
    imageUrl: json['imageUrl'] as String,
    dateTime: json['dateTime'] as String,
  );
}

Map<String, dynamic> _$ConsultationHistoryToJson(
        ConsultationHistory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'expertise': instance.expertise,
      'imageUrl': instance.imageUrl,
      'dateTime': instance.dateTime,
    };
