import 'package:cakeboss/backend/style/themeData.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData themeData;
  ThemeChanger({this.themeData});

  getTheme() => themeData;
  setTheme(bool value) {
    value?themeData = d1():themeData=exito();

    notifyListeners();
  }
}