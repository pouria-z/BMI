import 'package:flutter/material.dart';
import 'package:bmicalculator/HomePage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF0A0E19),
      scaffoldBackgroundColor: Color(0xFF0A0E23),
      canvasColor: Color(0xFF0A0E19),
    ),
  ));
}























