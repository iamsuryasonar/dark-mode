import 'package:flutter/material.dart';
import 'package:flutterdarklightmode/utils/theme/sharedpreferences.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemeSharedPreference darkThemeSharedPreference =
      DarkThemeSharedPreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  void updateTheme(bool value) {
    _darkTheme = value;
    darkThemeSharedPreference.setDarkTheme(value);
    notifyListeners();
  }
}
