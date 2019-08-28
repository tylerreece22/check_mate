// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User((json['checklists'] as List)
      ?.map((e) =>
          e == null ? null : Checklist.fromJson(e as Map<String, dynamic>))
      ?.toList())
    ..id = json['id'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'id': instance.id, 'checklists': instance.checklists};
