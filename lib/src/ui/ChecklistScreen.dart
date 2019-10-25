import 'package:check_mate/src/blocs/ChecklistManager.dart';
import 'package:check_mate/src/blocs/Provider.dart';
import 'package:flutter/material.dart';
import 'package:check_mate/src/models/Checklist.dart';

class ChecklistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChecklistManager manager = Provider.of<ChecklistManager>(context);
    return StreamBuilder(
        stream: manager.getChecklists,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              List<Checklist> checklists = snapshot.data;
              List<Widget> checklistWidgets = checklists
                  .map(
                    (checklist) => Container(
                      height: 50,
                      child: Card(
//                        color: Colors.amber[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Center(child: Text(checklist.name)),
                      ),
                    ),
                  )
                  .toList();
              // TODO: Set up reorderability
//              return ReorderableListView(
              return ListView(
                padding: const EdgeInsets.all(8.0),
                children: <Widget>[
                  Text('I am a header'),
                  ...checklistWidgets,
                ],
              );
          }
          return Text('should never get here');
        });
  }
}
