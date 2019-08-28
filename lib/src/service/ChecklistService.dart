import 'package:check_mate/src/models/Checklist.dart';
import 'package:check_mate/src/models/User.dart';
import 'package:check_mate/src/util/AppFileWriter.dart';

class ChecklistService {
  static AppFileWriter fileWriter = new AppFileWriter();
  //TODO: this is not static in the tutorial
  static Future<List<Checklist>> getChecklists() async {
    User user = await fileWriter.readUser();
    return user.checklists;
  }
}
