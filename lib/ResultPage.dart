import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bmicalculator/HomePage.dart';
import 'package:flutter/painting.dart';
import 'package:bmicalculator/CalculatorBrain.dart';

class ResultPage extends StatelessWidget {

  ResultPage ({@required this.bmiResult, @required this.interpretation, @required this.resultText,
    @required this.normalMinWeight, @required this.normalMaxWeight
  });
  final String bmiResult;
  final String resultText;
  final String interpretation;
  final String normalMinWeight;
  final String normalMaxWeight;

  static const inactiveColor = Color(0xFF1D1E30);
  static const myTextStyle = TextStyle(
    fontSize: 18,
    fontFamily: "Roboto",
  );
  static const myNumberStyle = TextStyle(
      fontSize: 30,
      fontFamily: "Barlow",
      fontWeight: FontWeight.w700
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Result",
          style: myTextStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/80,
          ),
          Text(
            "\tYour Result:",
            style: myTextStyle.copyWith(
              fontSize: 55,
              fontWeight: FontWeight.w700,
              fontFamily: "Barlow",
            ),
            textAlign: TextAlign.left,
          ),
          Expanded(
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width/1.1,
                decoration: BoxDecoration(
                  color: inactiveColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset.fromDirection(10,-3)
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: resultText=="normal" ?
                          myTextStyle.copyWith(
                            color: Colors.green, fontSize: 22)
                          : resultText=="overweight" ?
                          myTextStyle.copyWith(
                            color: Colors.red, fontSize: 22)
                          : resultText=="underweight" ?
                          myTextStyle.copyWith(
                            color: Colors.yellow, fontSize: 22)
                          : myTextStyle.copyWith(
                        color: Colors.red[900], fontSize: 22),
                    ),
                    Text(
                      bmiResult,
                      style: myNumberStyle.copyWith(
                        fontSize: 65,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        interpretation,
                        style: myTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context,
                CupertinoPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height/12,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF900030),
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  style: myTextStyle.copyWith(
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],

      ),

    );
  }
}
