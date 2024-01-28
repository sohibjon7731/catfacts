// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_facts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModel _$CatModelFromJson(Map<String, dynamic> json) => CatModel(
      id: json['_id'] as String? ?? '',
      user: json['user'] as String? ?? '',
      text: json['text'] as String? ?? '',
      v: json['__v'] as int? ?? 0,
      source: json['source'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      type: json['type'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$CatModelToJson(CatModel instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'text': instance.text,
      '__v': instance.v,
      'source': instance.source,
      'updatedAt': instance.updatedAt,
      'type': instance.type,
      'createdAt': instance.createdAt,
    };
