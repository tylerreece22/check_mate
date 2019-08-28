import 'package:check_mate/src/ui/ChecklistScreen.dart';
import 'package:flutter/material.dart';

import 'blocs/ChecklistManager.dart';
import 'blocs/Provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ChecklistManager>(
      data: ChecklistManager(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: SafeArea(child: ChecklistScreen()),
        ),
      ),
    );
  }
}
