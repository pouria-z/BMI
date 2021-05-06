import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bmicalculator/services/font.dart';
import 'package:bmicalculator/services/localization_service.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class AboutBMI extends StatelessWidget {
  final inactiveColor = Color(0xFF1D1E30);

  @override
  Widget build(BuildContext context) {
    var fonts = Provider.of<Fonts>(context, listen: false);
    return Consumer<Fonts>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "About BMI",
              style: fonts.textStyle,
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width - 30,
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
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(style: fonts.textStyle, children: [
                            TextSpan(
                              text: "about1".tr.toPersianDigit(),
                              style: fonts.textStyle.copyWith(
                                  fontFamily:
                                      LocalizationService.getCurrentLocale() ==
                                              Locale('en', 'US')
                                          ? "Roboto Light"
                                          : "Vazir"),
                            ),
                            TextSpan(
                                text: "about2".tr,
                                style: fonts.textStyle.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontStyle: FontStyle.italic)),
                            TextSpan(
                              text: "about3".tr.toPersianDigit(),
                              style: fonts.textStyle.copyWith(
                                  fontFamily:
                                      LocalizationService.getCurrentLocale() ==
                                              Locale('en', 'US')
                                          ? "Roboto Light"
                                          : "Vazir"),
                            ),
                          ]),
                        ),
                        Row(
                          children: [
                            Text(
                              "about4".tr,
                              style: fonts.textStyle.copyWith(
                                  fontFamily:
                                      LocalizationService.getCurrentLocale() ==
                                              Locale('en', 'US')
                                          ? "Roboto Light"
                                          : "Vazir",
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic),
                            ),
                            GestureDetector(
                              onTap: () {
                                var url = "https://wikipedia.org";
                                launch(url);
                              },
                              child: Text(
                                "about5".tr,
                                style: fonts.textStyle.copyWith(
                                  fontFamily:
                                      LocalizationService.getCurrentLocale() ==
                                              Locale('en', 'US')
                                          ? "Roboto Light"
                                          : "Vazir",
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.blue[700],
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
