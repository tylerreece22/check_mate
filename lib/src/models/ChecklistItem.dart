import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'ChecklistItem.g.dart';

@JsonSerializable()
class ChecklistItem {
  String name;
  String id;

  ChecklistItem(this.name) {
    Uuid uuid = new Uuid();
    this.id = uuid.v4();
  }

  factory ChecklistItem.fromJson(Map<String, dynamic> json) =>
      _$ChecklistItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChecklistItemToJson(this);
}
