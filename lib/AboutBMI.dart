import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';


class aboutBMI extends StatelessWidget {

  static const myTextStyle = TextStyle(
    fontSize: 18,
    fontFamily: "Roboto Light",
  );
  static const myNumberStyle = TextStyle(
    fontSize: 30,
    fontFamily: "Barlow",
    fontWeight: FontWeight.w400,
  );
  static final inactiveColor = Color(0xFF1D1E30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "About BMI",
          style: myTextStyle.copyWith(fontFamily: "Roboto"),
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
                      offset: Offset.fromDirection(10,-4)
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: myTextStyle,
                        children: [
                          TextSpan(
                            text: "Body mass index (BMI)",
                            style: myTextStyle.copyWith(fontWeight: FontWeight.w900),
                          ),
                          TextSpan(
                            text: " is a value derived from the mass (weight) and height of a person."
                                " The BMI is defined as the body mass divided by the square of the body height, and is expressed in units of ",
                          ),
                          TextSpan(
                            text: "kg/m\²",
                            style: myTextStyle.copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ", resulting from mass in kilograms and height in metres.",
                          ),
                          TextSpan(
                            text: "The BMI may be determined using a table[note 1] or chart which displays BMI as a function of mass and height"
                                " using contour lines or colours for different BMI categories, and which may use other units of measurement"
                                " (converted to metric units for the calculation). The BMI is a convenient rule of thumb used to broadly"
                                " categorize a person as ",
                          ),
                          TextSpan(
                            text: "underweight, normal weight, overweight, or obese ",
                            style: myTextStyle.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.w900, fontSize: 17),
                          ),
                          TextSpan(
                            text: "based on tissue mass (muscle, fat, and bone) and height. Commonly accepted BMI ranges are underweight"
                                " (under 18.5 kg/m\²), normal weight (18.5 to 25), overweight (25 to 30), and obese (over 30)."
                                " BMIs under 20 and over 25 have been associated with higher all-causes mortality,"
                                " with the risk increasing with distance from the 20–25 range.\n",
                          ),
                          TextSpan(
                            text: "\nHistory:\n",
                            style: myTextStyle.copyWith(decoration: TextDecoration.underline, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)
                          ),
                          TextSpan(
                            text: "\nAdolphe Quetelet",
                            style: myTextStyle.copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ", a Belgian astronomer, mathematician, statistician and sociologist,"
                                " devised the basis of the BMI between 1830 and 1850 as he developed what he called social physics."
                                " The modern term \"body mass index\" (BMI) for the ratio of human body weight to squared height was"
                                " coined in a paper published in the July 1972 edition of the Journal of Chronic Diseases by Ancel Keys"
                                " and others. In this paper, Keys argued that what he termed the BMI was \"...if not fully satisfactory,"
                                " at least as good as any other relative weight index as an indicator of relative obesity\"."
                          ),
                        ]
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\n\n\nSource: ",
                          style: myTextStyle.copyWith(fontSize: 13, fontStyle: FontStyle.italic),
                        ),
                        GestureDetector(
                          onTap: () {
                            var url="https://wikipedia.org";
                            launch(url);
                          },
                          child: Text(
                            "\n\n\nwikipedia",
                            style: myTextStyle.copyWith(
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
  }
}
