import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/lang/en_US.dart';
import 'package:bmicalculator/lang/fa_IR.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService extends Translations {

  static final local = Locale('en', 'US');
  static final fallBackLocale = Locale('en', 'US');
  static final languages = ['English', 'فارسی'];
  static final locals = [
    Locale('en', 'US'),
    Locale('fa', 'IR'),
  ];
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' : enUS,
    'fa_IR' : faIR,
  };
  static Locale getLocaleFromLanguage(String lang){
    for(int i=0;i<languages.length;i++){
      if(lang==languages[i]) return locals[i];
    }
    return Get.locale;
  }
  static void changeLocale(String lang){
    final locale = getLocaleFromLanguage(lang);
    final box = GetStorage();
    box.write('lng', lang);
    Get.updateLocale(locale);
  }
  static Locale getCurrentLocale(){
    final box = GetStorage();
    Locale defaultLocale;
    if(box.read('lng') != null){
      final locale = getLocaleFromLanguage(box.read('lng'));
      defaultLocale = locale;
    }
    else{
      defaultLocale = Locale('en', 'US');
    }
    return defaultLocale;
  }
  static String getCurrentLang(){
    final box = GetStorage();
    box.read('lng') != null ? box.read('lng') : 'English';
  }
}
