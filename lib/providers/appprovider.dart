import 'package:flutter/material.dart';
import 'package:digou/configs/ui_config.dart';

class AppProvider extends ChangeNotifier {
  ThemeData themeData;
  ThemeMode themeMode;
  AppProvider({this.themeData}) {
    this.themeData ??= defaultThemeData;
    this.themeMode ??= ThemeMode.light;
    initUIConfig();
  }

  void nextThemeMode() {
    switch (this.themeMode) {
      case ThemeMode.light:
        this.themeMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        this.themeMode = ThemeMode.system;
        break;
      default:
        this.themeMode = ThemeMode.light;
    }
    print(this.themeMode);
    notifyListeners();
  }
}
