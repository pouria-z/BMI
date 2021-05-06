import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmicalculator/HomePage.dart';
import 'package:bmicalculator/localization_service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:bmicalculator/font.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(ChangeNotifierProvider(
    create: (context) => Fonts(),
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(),
      locale: LocalizationService.getCurrentLocale(),
      fallbackLocale: Locale('en', 'US'),
      home: HomePage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E19),
        scaffoldBackgroundColor: Color(0xFF0A0E23),
        canvasColor: Color(0xFF0A0E23),
        // textTheme: TextTheme(
        //   bodyText1: TextStyle(
        //     color: Colors.white,
        //     fontSize: 18,
        //     fontFamily: LocalizationService.getCurrentLocale()==Locale('en', 'US')
        //         ? "Roboto"
        //         : "Vazir"
        //   ),
        //   bodyText2: TextStyle(
        //       color: Colors.white,
        //       fontSize: 30,
        //       fontFamily: LocalizationService.getCurrentLocale()==Locale('en', 'US')
        //           ? "Barlow"
        //           : "Lalezar"
        //   ),
        // ),
      ),
    ),
  ));
}























