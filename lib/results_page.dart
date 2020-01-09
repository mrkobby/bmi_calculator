import 'package:bmi_calculator/constants_and_widgets.dart';
import 'package:bmi_calculator/reusable_cards.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATION"),
          centerTitle: true,
          elevation: 15.0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Expanded(
                flex: 10,
                child: ReUsableCard(
                  cardColor: kActiveCardColor,
                  cardMargin: EdgeInsets.symmetric(horizontal: 20.0),
                  cardPadding: EdgeInsets.all(20.0),
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ResultTextTemplate(
                        textTitle: resultText,
                        textColor: resultText == "OVERWEIGHT" ? Colors.red : Colors.green,
                        textSize: 20.0,
                        textWeight: FontWeight.bold,
                      ),
                      ResultTextTemplate(
                        textTitle: bmiResult,
                        textColor: Colors.white,
                        textSize: 80.0,
                        textWeight: FontWeight.w900,
                      ),
                      Column(
                        children: <Widget>[
                          ResultTextTemplate(
                            textTitle: "Normal BMI range:",
                            textColor: kInactiveTextColor,
                            textSize: 20.0,
                            textWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ResultTextTemplate(
                            textTitle: "18,5 - 25 kg/m2",
                            textColor: kActiveTextColor,
                            textSize: 20.0,
                            textWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ResultTextTemplate(
                        textTitle: interpretation,
                        textColor: Colors.white,
                        textSize: 24.0,
                        textWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      // FlatButton(
                      //   color: Color(0xff1D1F63),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(20.0),
                      //     child: ResultTextTemplate(
                      //       textTitle: "SAVE RESULT",
                      //       textSize: 16.0,
                      //     ),
                      //   ),
                      //   onPressed: () {},
                      // )
                    ],
                  ),
                )),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: BigBottomButton(
                buttonTitle: "RE-CALCULATE YOUR BMI",
              ),
            )
          ],
        ));
  }
}
