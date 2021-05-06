import 'dart:async';
import 'package:bmicalculator/localization_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/ResultPage.dart';
import 'package:bmicalculator/CalculatorBrain.dart';
import 'package:bmicalculator/font.dart';
import 'package:bmicalculator/AboutBMI.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const activeColor = Color(0xFF0A0E19);
  static const inactiveColor = Color(0xFF1D1E30);

  String lng;
  Color maleColor = inactiveColor;
  Color femaleColor = inactiveColor;

  Timer timer;

  double height = 160;
  int weight = 60;
  int age = 20;

  void sliderHeight(double value) {
    setState(() {
      this.height = value;
    });
  }

  @override
  void initState() {
    super.initState();
    LocalizationService.getCurrentLocale();
    lng = LocalizationService.getCurrentLang();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Fonts>(context, listen: false).changeTextStyle();
      // Provider.of<Fonts>(context, listen: false).changeTextStyle2();
      Provider.of<Fonts>(context, listen: false).changeNumStyle();
    });
  }

  @override
  Widget build(BuildContext context) {
    var fonts = Provider.of<Fonts>(context, listen: false);
    return Consumer<Fonts>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("title".tr, style: fonts.textStyle),
            elevation: 5,
            shadowColor: Colors.black,
          ),
          drawer: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Drawer(
              elevation: 1,
              child: SafeArea(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(FontAwesomeIcons.infoCircle),
                      title: Text(
                        "about".tr,
                        style: fonts.textStyle,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => AboutBMI(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.solidEnvelope),
                      title: Text(
                        "contact".tr,
                        style: fonts.textStyle,
                      ),
                      onTap: () async {
                        var url =
                            "mailto:pouria.zeinalzadeh@gmail.com?subject=BMI Calculator";
                        await launch(url);
                      },
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.solidStar),
                      title: Text(
                        "rate".tr,
                        style: fonts.textStyle,
                      ),
                      onTap: () {
                        var url =
                            "https://cafebazaar.ir/app/com.pouria.bmicalculator?l=en";
                        launch(url);
                      },
                    ),
                    ListTile(
                      leading: Icon(FontAwesomeIcons.googlePlay),
                      title: Text(
                        "apps".tr,
                        style: fonts.textStyle,
                      ),
                      onTap: () {
                        var url =
                            "https://cafebazaar.ir/developer/413934687302?l=en";
                        launch(url);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.language_rounded),
                      title: Text(
                        "lang".tr,
                        style: fonts.textStyle,
                      ),
                      trailing: DropdownButton<String>(
                        items:
                        LocalizationService.languages.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: lng,
                        dropdownColor: Color(0xFF0A0E30),
                        disabledHint: Text("Choose"),
                        hint: Text(
                          "langChoose".tr,
                          style: fonts.textStyle
                              .copyWith(color: Colors.white54, fontSize: 14),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            this.lng = newValue;
                            LocalizationService.changeLocale(newValue);
                            fonts.changeTextStyle();
                            fonts.changeNumStyle();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          maleColor = activeColor;
                          femaleColor = inactiveColor;
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          color: maleColor,
                          boxShadow: [
                            maleColor == activeColor
                                ? BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                    offset: Offset.fromDirection(10, -1))
                                : BoxShadow(
                                    color: Colors.black54,
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: Offset.fromDirection(10, -5))
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.mars,
                              size: 50,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "male".tr,
                              style: fonts.textStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          femaleColor = activeColor;
                          maleColor = inactiveColor;
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                            color: femaleColor,
                            boxShadow: [
                              femaleColor == activeColor
                                  ? BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 0,
                                      blurRadius: 1,
                                      offset: Offset.fromDirection(10, -1))
                                  : BoxShadow(
                                      color: Colors.black54,
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset.fromDirection(10, -5))
                            ],
                            shape: BoxShape.circle),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.venus,
                              size: 50,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text("female".tr, style: fonts.textStyle),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: MediaQuery.of(context).size.height / 4.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: inactiveColor,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87,
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset.fromDirection(10, -4)),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("height".tr, style: fonts.textStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            LocalizationService.getCurrentLocale() ==
                                    Locale('en', 'US')
                                ? "$height"
                                : "$height".toPersianDigit(),
                            style: fonts.numStyle,
                          ),
                          Text("cm".tr, style: fonts.textStyle),
                        ],
                      ),
                      Slider(
                        value: this.height,
                        autofocus: true,
                        onChanged: sliderHeight,
                        activeColor: Colors.white,
                        min: 40,
                        max: 220,
                        divisions: 360,
                        label: LocalizationService.getCurrentLocale() ==
                                Locale('en', 'US')
                            ? "$height"
                            : "$height".toPersianDigit(),
                        inactiveColor:
                            Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4.5,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: inactiveColor,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87,
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset.fromDirection(10, -5)),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "weight".tr,
                            style: fonts.textStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                LocalizationService.getCurrentLocale() ==
                                        Locale('en', 'US')
                                    ? "$weight"
                                    : "$weight".toPersianDigit(),
                                style: fonts.numStyle,
                              ),
                              Text("kg".tr, style: fonts.textStyle),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onLongPress: () {
                                  timer = Timer.periodic(
                                      Duration(milliseconds: 60), (timer) {
                                    setState(() {
                                      if (201 > weight && weight > 1) {
                                        weight--;
                                      }
                                    });
                                  });
                                },
                                onLongPressEnd: (details) => timer.cancel(),
                                child: FloatingActionButton(
                                  heroTag: 1,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    size: 20,
                                    color: Color(0xFF0A0E23),
                                  ),
                                  mini: true,
                                  backgroundColor: Color(0xFF4C4F5E),
                                  elevation: 2,
                                ),
                              ),
                              GestureDetector(
                                onLongPress: () {
                                  timer = Timer.periodic(
                                      Duration(milliseconds: 60), (timer) {
                                    setState(() {
                                      if (200 > weight && weight > 0) {
                                        weight++;
                                      }
                                    });
                                  });
                                },
                                onLongPressEnd: (details) => timer.cancel(),
                                child: FloatingActionButton(
                                  heroTag: 2,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    size: 20,
                                    color: Color(0xFF0A0E23),
                                  ),
                                  mini: true,
                                  backgroundColor: Color(0xFF4C4F5E),
                                  elevation: 2,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 4.5,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: inactiveColor,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black87,
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset.fromDirection(10, -4)),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "age".tr,
                            style: fonts.textStyle,
                          ),
                          Text(
                            LocalizationService.getCurrentLocale() ==
                                    Locale('en', 'US')
                                ? "$age"
                                : "$age".toPersianDigit(),
                            style: fonts.numStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onLongPress: () {
                                  timer = Timer.periodic(
                                      Duration(milliseconds: 60), (timer) {
                                    setState(() {
                                      if (101 > age && age > 1) {
                                        age--;
                                      }
                                    });
                                  });
                                },
                                onLongPressEnd: (details) => timer.cancel(),
                                child: FloatingActionButton(
                                  heroTag: 3,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.minus,
                                    size: 20,
                                    color: Color(0xFF0A0E23),
                                  ),
                                  mini: true,
                                  backgroundColor: Color(0xFF4C4F5E),
                                  elevation: 2,
                                ),
                              ),
                              GestureDetector(
                                onLongPress: () {
                                  timer = Timer.periodic(
                                      Duration(milliseconds: 60), (timer) {
                                    setState(() {
                                      if (100 > age && age > 0) {
                                        age++;
                                      }
                                    });
                                  });
                                },
                                onLongPressEnd: (details) => timer.cancel(),
                                child: FloatingActionButton(
                                  heroTag: 4,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.plus,
                                    size: 20,
                                    color: Color(0xFF0A0E23),
                                  ),
                                  mini: true,
                                  backgroundColor: Color(0xFF4C4F5E),
                                  elevation: 2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  calculatorBrain calc = calculatorBrain(height, weight);
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ResultPage(
                        bmiResult: calc.calculateBMI(),
                        interpretation: calc.getInterpretation(),
                        resultText: calc.getResult(),
                        normalMinWeight: calc.normalMinimumWeight(),
                        normalMaxWeight: calc.normalMaximumWeight(),
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: 'cal',
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 12,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xFF900030),
                      child: Center(
                        child: Text(
                          "calculate".tr,
                          style: fonts.textStyle.copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
