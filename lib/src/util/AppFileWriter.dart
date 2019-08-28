import 'dart:convert';
import 'dart:io';

import 'package:check_mate/src/models/Checklist.dart';
import 'package:check_mate/src/models/User.dart';
import 'package:path_provider/path_provider.dart';

class AppFileWriter {
  User user;
  String fileName = 'user.json';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  Future<File> get _localHistoryFile async {
    final path = await _localPath;
    return File('$path/checklistHistory.json');
  }

  Future<User> readUser() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();
      print('Reading contents of file: ' + contents);
      Map<String, dynamic> jsonMap = await jsonDecode(contents);
      // Convert JSON to User
      user = User.fromJson(jsonMap);
      return user;
    } catch (e) {
      print(e);
      // If there is no User then
      // - create a new one
      // - write the new User
      // and return it
      user = new User(<Checklist>[
        Checklist('Jax Packing List',
            ['4 shirts', 'Pants', 'Wallet', 'Car Charger', 'Running shoes'])
      ]);
      await _writeNewUser();
      return user;
    }
  }

  _writeNewUser() async {
    final file = await _localFile;
    print('Writing new user!');
    final userString = jsonEncode(user);
    file.writeAsString(userString);
  }

  Future<Checklist> writeRoutine(Checklist checklist, {isHistory}) async {
    File file;
    user.checklists.add(checklist);
    if (isHistory != null) {
      file = await _localHistoryFile;
    } else {
      file = await _localFile;
    }
    final userString = jsonEncode(user);
    print('writing to file: ' + userString);

    // Write the file.
    await file.writeAsString(userString);
    return checklist;
  }

  deleteChecklist(String uuid) async {
    user.checklists =
        user.checklists.where((checklist) => checklist.id != uuid).toList();
    final file = await _localFile;
    final userString = jsonEncode(user);
    print('deleted and writing to file: ' + userString);

    // Write the file.
    await file.writeAsString(userString);
  }

  Future<Checklist> updateRoutine(Checklist checklist) async {
    await deleteChecklist(checklist.id);
    await writeRoutine(checklist);
    return checklist;
  }
}
