import 'package:flutter/material.dart';

class ThemeConstant {
  ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      fontFamily: 'DMSans',
      textTheme: Theme.of(context).textTheme.apply(fontSizeFactor: 1, fontSizeDelta: 2.0),
    );
  }

  ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      fontFamily: 'DMSans',
      textTheme: Theme.of(context).textTheme.apply(fontSizeFactor: 1, fontSizeDelta: 2.0),
    );
  }
}
