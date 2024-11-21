import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider extends ChangeNotifier {
   String current_language = "en";
  ThemeMode current_theme = ThemeMode.light  ;

  Future<void> changeLanguage(String newLanguage) async {
    //if (current_language == newLanguage) return;
    current_language = newLanguage;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', current_language);
    //print(current_language);
    notifyListeners(); //to change value in the list of subscribe
  }

  Future<void>changeTheme(ThemeMode newTheme) async {
    //if (current_theme == newTheme) return;
    current_theme = newTheme;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", current_theme.name);
    //print(current_theme);

    notifyListeners();
  }

  String getBackground() {
    return current_theme == ThemeMode.light
        ? "assets/images/main.bg.png"
        : "assets/images/main_dark.png";
  }
  bool isDark() {
    return current_theme == ThemeMode.dark;
  }
  Future<void> loadSettings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String?  language = prefs.getString('language');
    String? theme = prefs.getString("theme");
    language??="en";
      current_language=language;

    theme??="light";
      current_theme=(theme=="dark"?ThemeMode.dark:ThemeMode.light);
  }
}
////