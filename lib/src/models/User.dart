import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

import 'Checklist.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  String id;
  List<Checklist> checklists;

  User(this.checklists) {
    Uuid uuid = new Uuid();
    this.id = uuid.v4();
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
