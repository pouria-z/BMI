import 'dart:math';
import 'package:bmicalculator/localization_service.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class calculatorBrain {
  double height;
  int weight;
  double bmi;
  double normalMinWeight;
  double normalMaxWeight;

  calculatorBrain(this.height, this.weight);

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String normalMinimumWeight() {
    normalMinWeight = 18.5 * pow(height / 100, 2);
    return normalMinWeight.toStringAsFixed(1);
  }

  String normalMaximumWeight() {
    normalMaxWeight = 24.9 * pow(height / 100, 2);
    return normalMaxWeight.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25 && bmi < 30) {
      return "overweight".tr;
    } else if (bmi >= 18.5 && bmi < 25) {
      return "normal".tr;
    } else if (bmi >= 30) {
      return "obese".tr;
    } else if (bmi < 18.5) {
      return "underweight".tr;
    }
  }

  String getInterpretation() {
    var bmiTr = LocalizationService.getCurrentLocale() == Locale('en', 'US')
        ? bmi.toStringAsFixed(1)
        : bmi.toStringAsFixed(1).toPersianDigit();
    var normalMinWeightTr =
        LocalizationService.getCurrentLocale() == Locale('en', 'US')
            ? normalMinimumWeight().toString()
            : normalMinimumWeight().toString().toPersianDigit();
    var normalMaxWeightTr =
        LocalizationService.getCurrentLocale() == Locale('en', 'US')
            ? normalMaximumWeight().toString()
            : normalMaximumWeight().toString().toPersianDigit();
    if (bmi >= 25 && bmi < 30) {
      return "desc1".tr +
          bmiTr +
          "desc2".tr +
          "descOver3".tr +
          "desc4".tr +
          normalMinWeightTr +
          "desc5".tr +
          normalMaxWeightTr +
          "descOver6".tr;
    } else if (bmi >= 18.5 && bmi < 25) {
      return "desc1".tr +
          bmiTr +
          "desc2".tr +
          "descNorm3".tr +
          "desc4".tr +
          normalMinWeightTr +
          "desc5".tr +
          normalMaxWeightTr +
          "descNorm6".tr;
    } else if (bmi > 30) {
      return "desc1".tr +
          bmiTr +
          "desc2".tr +
          "descOb3".tr +
          "desc4".tr +
          normalMinWeightTr +
          "desc5".tr +
          normalMaxWeightTr +
          "descOb6".tr;
    } else if (bmi < 18.5) {
      return "desc1".tr +
          bmiTr +
          "desc2".tr +
          "descUnder3".tr +
          "desc4".tr +
          normalMinWeightTr +
          "desc5".tr +
          normalMaxWeightTr +
          "descUnder6".tr;
    }
  }
}
