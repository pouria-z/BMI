import 'package:flutter/material.dart';
import 'package:bmicalculator/localization_service.dart';

class Fonts with ChangeNotifier {
  TextStyle textStyle;
  TextStyle numStyle;
  void changeTextStyle() {
    textStyle = TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: LocalizationService.getCurrentLocale()==Locale('en', 'US')
            ? "Roboto"
            : "Vazir"
    );
    notifyListeners();
  }
  void changeNumStyle() {
    numStyle = TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontFamily: LocalizationService.getCurrentLocale()==Locale('en', 'US')
            ? "Barlow"
            : "Lalezar"
    );
    notifyListeners();
  }
}