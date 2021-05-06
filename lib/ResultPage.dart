import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bmicalculator/HomePage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:bmicalculator/font.dart';
import 'package:bmicalculator/localization_service.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.interpretation,
      @required this.resultText,
      @required this.normalMinWeight,
      @required this.normalMaxWeight});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final String normalMinWeight;
  final String normalMaxWeight;

  static const inactiveColor = Color(0xFF1D1E30);

  @override
  Widget build(BuildContext context) {
    var fonts = Provider.of<Fonts>(context, listen: false);
    return Consumer<Fonts>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("result".tr, style: fonts.textStyle),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "yourRes".tr,
                  style: fonts.numStyle.copyWith(
                    fontSize: MediaQuery.of(context).size.width / 10,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: inactiveColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87,
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset.fromDirection(10, -3)),
                      ],
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              resultText.toUpperCase(),
                              style:
                                  resultText == "normal" || resultText == "عادی"
                                      ? fonts.textStyle.copyWith(
                                          color: Colors.green, fontSize: 22)
                                      : resultText == "overweight" ||
                                              resultText == "اضافه وزن"
                                          ? fonts.textStyle.copyWith(
                                              color: Colors.red, fontSize: 22)
                                          : resultText == "underweight" ||
                                                  resultText == "کمبود وزن"
                                              ? fonts.textStyle.copyWith(
                                                  color: Colors.yellow,
                                                  fontSize: 22)
                                              : fonts.textStyle.copyWith(
                                                  color: Colors.red[900],
                                                  fontSize: 22),
                            ),
                            Text(
                              LocalizationService.getCurrentLocale() ==
                                      Locale('en', 'US')
                                  ? bmiResult
                                  : bmiResult.toPersianDigit(),
                              style: fonts.numStyle.copyWith(
                                fontSize: 65,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: SelectableText(
                                interpretation,
                                style: fonts.textStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => HomePage(),
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
                          "reCal".tr,
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
