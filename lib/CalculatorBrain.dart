import 'dart:math';

class calculatorBrain {

  final double height;
  final int weight;
  double _bmi;
  double normalMinWeight;
  double normalMaxWeight;

  calculatorBrain(this.height, this.weight);

  String calculateBMI() {

    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);

  }

  String normalMinimumWeight() {

    normalMinWeight = 18.5 * pow(height/100, 2);
    return normalMinWeight.toStringAsFixed(1);

  }

  String normalMaximumWeight() {

    normalMaxWeight = 24.9 * pow(height/100, 2);
    return normalMaxWeight.toStringAsFixed(1);

  }

  String getResult() {

    if(_bmi >= 25 && _bmi <30){
      return "overweight";
    }
    else if(_bmi >= 18.5 && _bmi <25){
      return "normal";
    }
    else if(_bmi >= 30){
      return "obese!";
    }
    else if(_bmi < 18.5){
      return "underweight";
    }

  }

  String getInterpretation() {

    if(_bmi >= 25 && _bmi <30){
      return "Your BMI is ${_bmi.toStringAsFixed(1)}, indicating your weight is in the Overweight category for adults of your height. "
          "For your height, a normal weight range would be from ${normalMinimumWeight().toString()} to ${normalMaximumWeight().toString()} kilograms. "
          "People who are overweight or obese are at higher risk for chronic conditions such as high blood pressure, diabetes, and high cholesterol.";
    }
    else if(_bmi >= 18.5 && _bmi <25){
      return "Your BMI is ${_bmi.toStringAsFixed(1)}, indicating your weight is in the Normal category for adults of your height. "
          "For your height, a normal weight range would be from ${normalMinimumWeight().toString()} to ${normalMaximumWeight().toString()} kilograms. "
          "Maintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity.";
    }
    else if(_bmi > 30){
      return "Your BMI is ${_bmi.toStringAsFixed(1)}, indicating your weight is in the Obese category for adults of your height. "
          "For your height, a normal weight range would be from ${normalMinimumWeight().toString()} to ${normalMaximumWeight().toString()} kilograms. "
          "People who are overweight or obese are at higher risk for chronic conditions such as high blood pressure, diabetes, and high cholesterol.";
    }
    else if(_bmi < 18.5){
      return "Your BMI is ${_bmi.toStringAsFixed(1)}, indicating your weight is in the Underweight category for adults of your height. "
          "For your height, a normal weight range would be from ${normalMinimumWeight().toString()} to ${normalMaximumWeight().toString()} kilograms. "
          "Talk with your healthcare provider to determine possible causes of underweight and if you need to gain weight.";
    }

  }

}