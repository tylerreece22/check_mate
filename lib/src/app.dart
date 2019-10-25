import 'package:check_mate/src/ui/ChecklistScreen.dart';
import 'package:flutter/material.dart';

import 'blocs/ChecklistManager.dart';
import 'blocs/Provider.dart';
import 'util/Theme.dart';

class App extends StatelessWidget {
  final ThemeData myTheme = buildTheme();
  @override
  Widget build(BuildContext context) {
    return Provider<ChecklistManager>(
      data: ChecklistManager(),
      child: MaterialApp(
        theme: myTheme,
        home: Scaffold(
          body: SafeArea(child: ChecklistScreen()),
        ),
      ),
    );
  }
}
