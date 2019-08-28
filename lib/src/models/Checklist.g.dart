// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Checklist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checklist _$ChecklistFromJson(Map<String, dynamic> json) {
  return Checklist(json['name'] as String,
      (json['items'] as List)?.map((e) => e as String)?.toList())
    ..id = json['id'] as String;
}

Map<String, dynamic> _$ChecklistToJson(Checklist instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'items': instance.items
    };
