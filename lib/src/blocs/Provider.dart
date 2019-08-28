import 'package:flutter/material.dart';

import 'ChecklistManager.dart';

class Provider<T> extends InheritedWidget {
  final T data;

  Provider({Key key, Widget child, this.data}) : super(key: key, child: child);

  static ChecklistManager of<T>(BuildContext context) {
    final _type = _typeOf<Provider<T>>();
    return (context.inheritFromWidgetOfExactType(_type) as Provider).data;
  }

  static Type _typeOf<T>() => T;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
