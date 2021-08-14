import 'package:json_annotation/json_annotation.dart';

part 'history_consultation.g.dart';

@JsonSerializable()
class ConsultationHistory {
  final String name;
  final String expertise;
  final String imageUrl;
  final String dateTime;

  ConsultationHistory({
    required this.name,
    required this.expertise,
    required this.imageUrl,
    required this.dateTime,
  });

  factory ConsultationHistory.fromJson(Map<String, dynamic> json) =>
      _$ConsultationHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationHistoryToJson(this);
}
