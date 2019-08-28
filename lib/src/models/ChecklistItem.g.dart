// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChecklistItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChecklistItem _$ChecklistItemFromJson(Map<String, dynamic> json) {
  return ChecklistItem(json['name'] as String)..id = json['id'] as String;
}

Map<String, dynamic> _$ChecklistItemToJson(ChecklistItem instance) =>
    <String, dynamic>{'name': instance.name, 'id': instance.id};
