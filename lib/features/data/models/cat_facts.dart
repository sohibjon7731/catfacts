import 'package:json_annotation/json_annotation.dart';

part 'cat_facts.g.dart';

@JsonSerializable()
class CatModel {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "user", defaultValue: "")
  final String user;
  @JsonKey(name: "text", defaultValue: "")
  final String text;
  @JsonKey(name: "__v", defaultValue: 0)
  final int v;
  @JsonKey(name: "source", defaultValue: "")
  final String source;
  @JsonKey(name: "updatedAt", defaultValue: "")
  final String updatedAt;
  @JsonKey(name: "type", defaultValue: "")
  final String type;
  @JsonKey(name: "createdAt", defaultValue: "")
  final String createdAt;
  CatModel({
    required this.id,
    required this.user,
    required this.text,
    required this.v,
    required this.source,
    required this.updatedAt,
    required this.type,
    required this.createdAt,
  });
  factory CatModel.fromJson(Map<String, dynamic> json) =>
      _$CatModelFromJson(json);

  Map<String, dynamic> toJson() => _$CatModelToJson(this);
}
