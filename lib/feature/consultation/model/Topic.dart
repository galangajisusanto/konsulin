import 'package:json_annotation/json_annotation.dart';

part 'Topic.g.dart';

@JsonSerializable()
class Topic {
  final String name;
  final String description;
  bool? isSelected;

  Topic(
      {required this.name, required this.description, this.isSelected = false});

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);
}
