import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/ResultPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bmicalculator/CalculatorBrain.dart';
import 'package:bmicalculator/AboutBMI.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const activeColor = Color(0xFF0A0E19);
  static const inactiveColor = Color(0xFF1D1E30);
  static const myTextStyle = TextStyle(
    fontSize: 18,
    fontFamily: "Roboto",
  );
  static const myNumberStyle = TextStyle(
    fontSize: 30,
    fontFamily: "Barlow",
    fontWeight: FontWeight.w400,
  );


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
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(
            "BMI Calculator",
            style: myTextStyle
        ),
        elevation: 5,
        shadowColor: Colors.black,
      ),
      drawer: Drawer(
        elevation: 1,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Color(0xFF900030)
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/icon/icon.png'),
              ),
              accountName: Text(""),
              accountEmail: Text(
                "\© Developed by\nPouria Zeinalzadeh",
                style: myTextStyle.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.infoCircle),
              title: Text(
                "About BMI",
                style: myTextStyle,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => aboutBMI(),
                    ),
                );
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.solidEnvelope),
              title: Text(
                "Contact Me",
                style: myTextStyle,
              ),
              onTap: () async {
                var url = "mailto:pouria.zeinalzadeh@gmail.com?subject=BMI Calculator";
                await launch(url);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.solidStar),
              title: Text(
                "Rate This App",
                style: myTextStyle,
              ),
              onTap: () {
                var url = "https://cafebazaar.ir/app/com.pouria.bmicalculator?l=en";
                launch(url);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.googlePlay),
              title: Text(
                "My Other Apps",
                style: myTextStyle,
              ),
              onTap: () {
                var url = "https://cafebazaar.ir/developer/413934687302?l=en";
                launch(url);
              },
            ),
          ],
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
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                      color: maleColor,
                      boxShadow: [
                        maleColor==activeColor
                            ? BoxShadow(
                            color: Colors.black,
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: Offset.fromDirection(10,-1)
                        )
                            : BoxShadow(
                            color: Colors.black54,
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset.fromDirection(10,-5)
                        )
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
                          "Male",
                          style: myTextStyle,
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
                    height: MediaQuery.of(context).size.height/5,
                    width: MediaQuery.of(context).size.width/3,
                    decoration: BoxDecoration(
                        color: femaleColor,
                        boxShadow: [
                          femaleColor==activeColor
                              ? BoxShadow(
                              color: Colors.black,
                              spreadRadius: 0,
                              blurRadius: 1,
                              offset: Offset.fromDirection(10,-1)
                          )
                              : BoxShadow(
                              color: Colors.black54,
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset.fromDirection(10,-5)
                          )
                        ],
                        shape: BoxShape.circle
                    ),
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
                        Text(
                            "Female",
                            style: myTextStyle
                        ),
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
              height: MediaQuery.of(context).size.height/4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: inactiveColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black87,
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset.fromDirection(10,-4)
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "HEIGHT",
                      style: myTextStyle
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        "$height",
                        style: myNumberStyle,
                      ),
                      Text(" cm",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Martel",
                          textBaseline: TextBaseline.alphabetic,
                        ),
                      ),
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
                    label: "$height",
                    inactiveColor: Color(0xFF0A0E23),
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
                  height: MediaQuery.of(context).size.height/4.5,
                  width: MediaQuery.of(context).size.width/2.5,
                  decoration: BoxDecoration(
                    color: inactiveColor,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87,
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset.fromDirection(10,-5)
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: myTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            "$weight",
                            style: myNumberStyle,
                          ),
                          Text(
                            " kg",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Martel",
                              textBaseline: TextBaseline.alphabetic,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              timer = Timer.periodic(Duration(milliseconds: 60), (timer) {
                                setState(() {
                                  if(201>weight && weight>1){
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
                              timer = Timer.periodic(Duration(milliseconds: 60), (timer) {
                                setState(() {
                                  if(200>weight && weight>0){
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
                  height: MediaQuery.of(context).size.height/4.5,
                  width: MediaQuery.of(context).size.width/2.5,
                  decoration: BoxDecoration(
                    color: inactiveColor,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87,
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset.fromDirection(10,-4)
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: myTextStyle,
                      ),
                      Text(
                        "$age",
                        style: myNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onLongPress: () {
                              timer = Timer.periodic(Duration(milliseconds: 60), (timer) {
                                setState(() {
                                  if(101>age && age>1){
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
                              timer = Timer.periodic(Duration(milliseconds: 60), (timer) {
                                setState(() {
                                  if(100>age && age>0){
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
              Navigator.push(context,
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
            child: Container(
              height: MediaQuery.of(context).size.height/12,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF900030),
              child: Center(
                child: Text(
                  "CALCULATE",
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



