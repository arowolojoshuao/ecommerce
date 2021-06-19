import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// We have created a class DarkThemePreference where we are storing the bool value
// in for the dark theme, we have two methods for saving and retrieving the bool value.
class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}

// We are accessing the preference value through the provider so whenever there is
// any change the notifyListeners() UI will be updated if we have attached the provider to the screen.

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get changeTheme => _darkTheme;

  set changeTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
