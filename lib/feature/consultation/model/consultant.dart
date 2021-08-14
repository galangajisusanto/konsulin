import 'package:json_annotation/json_annotation.dart';

part 'consultant.g.dart';

@JsonSerializable()
class Consultant {
  final String name;
  final String profession;
  final String expertise;
  final String imageUrl;

  Consultant({
    required this.name,
    required this.profession,
    required this.expertise,
    required this.imageUrl,
  });

  factory Consultant.fromJson(Map<String, dynamic> json) =>
      _$ConsultantFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultantToJson(this);
}
