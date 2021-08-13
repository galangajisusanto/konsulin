import 'package:json_annotation/json_annotation.dart';

part 'sme.g.dart';

@JsonSerializable()
class Sme {
  final String name;
  final String address;
  final String phone;

  Sme({
    required this.name,
    required this.address,
    required this.phone,
  });

  factory Sme.fromJson(Map<String, dynamic> json) => _$SmeFromJson(json);

  Map<String, dynamic> toJson() => _$SmeToJson(this);
}
