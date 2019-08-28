import 'package:check_mate/src/blocs/ChecklistManager.dart';
import 'package:check_mate/src/blocs/Provider.dart';
import 'package:flutter/material.dart';
import 'package:check_mate/src/models/Checklist.dart';

class ChecklistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChecklistManager manager = Provider.of<ChecklistManager>(context);
    return StreamBuilder(
        stream: manager.checklistView,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              List<Checklist> checklists = snapshot.data;

//              return builder(context, checklists);
              return Text(checklists[0].items[0]);
          }
          return Text('should never get here');
        });
  }
}
