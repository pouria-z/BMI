import 'package:flutter/material.dart';
import 'package:bmicalculator/screens/home.dart';
import 'package:bmicalculator/services/localization_service.dart';
import 'package:bmicalculator/services/font.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';


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
      ),
    ),
  ));
}
