import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'Checklist.g.dart';

@JsonSerializable()
class Checklist {
  String name;
  String id;
  List<String> items;

  Checklist(this.name, this.items) {
    Uuid uuid = new Uuid();
    this.id = uuid.v4();
  }

  factory Checklist.fromJson(Map<String, dynamic> json) =>
      _$ChecklistFromJson(json);

  Map<String, dynamic> toJson() => _$ChecklistToJson(this);
}
