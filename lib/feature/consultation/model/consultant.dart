import 'package:json_annotation/json_annotation.dart';

part 'consultant.g.dart';

@JsonSerializable()
class Consultant {
  @JsonKey(name: 'nama_konsultan')
  final String name;
  @JsonKey(name: 'posisi_konsultan')
  final String profession;
  @JsonKey(name: 'topik')
  final String expertise;
  @JsonKey(name: 'foto')
  final String imageUrl;
  @JsonKey(name: 'tempat_kerja_konsultan')
  final String workingOn;
  @JsonKey(name: 'alumni')
  final String alumni;
  @JsonKey(name: 'pengalaman_kerja')
  final String workingExperience;
  @JsonKey(name: 'social_media')
  final String socialMedia;

  Consultant({
    required this.name,
    required this.profession,
    required this.expertise,
    required this.imageUrl,
    required this.workingOn,
    required this.alumni,
    required this.workingExperience,
    required this.socialMedia,
  });

  factory Consultant.fromJson(Map<String, dynamic> json) =>
      _$ConsultantFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultantToJson(this);
}
