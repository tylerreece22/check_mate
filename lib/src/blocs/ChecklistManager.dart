import 'package:check_mate/src/models/Checklist.dart';
import 'package:check_mate/src/service/ChecklistService.dart';

class ChecklistManager {
  Stream<List<Checklist>> get getChecklists =>
      Stream.fromFuture(ChecklistService.getChecklists());

  writeChecklists(Checklist checklist) =>
      ChecklistService.writeChecklist(checklist);

  updateChecklist(Checklist checklist) =>
      ChecklistService.updateChecklist(checklist);
}
