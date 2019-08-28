import 'package:check_mate/src/models/Checklist.dart';
import 'package:check_mate/src/service/ChecklistService.dart';

class ChecklistManager {
  Stream<List<Checklist>> get checklistView =>
      Stream.fromFuture(ChecklistService.getChecklists());
}
