import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants_and_widgets.dart';
import 'icon_content.dart';
import 'results_page.dart';
import 'reusable_cards.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

Gender selectedGender;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int sliderHeightValue = 175;
  int weight = 74;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATION"),
        centerTitle: true,
        elevation: 15.0,
        actions: <Widget>[
          IconButton(
            tooltip: "Reset",
            onPressed: () {
              setState(() {
                sliderHeightValue = 175;
                weight = 74;
                age = 19;
              });
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReUsableCard(
                      cardMargin: EdgeInsets.only(
                          top: 30.0, left: 30.0, right: 3.0, bottom: 5.0),
                      cardColor: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: CardIconContent(
                          cardGender: "MALE",
                          textColor: selectedGender == Gender.male
                              ? kActiveTextColor
                              : kInactiveTextColor),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReUsableCard(
                      cardMargin: EdgeInsets.only(
                          top: 30.0, left: 3.0, right: 30.0, bottom: 5.0),
                      cardColor: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: CardIconContent(
                          cardGender: "FEMALE",
                          textColor: selectedGender == Gender.female
                              ? kActiveTextColor
                              : kInactiveTextColor),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: ReUsableCard(
                cardMargin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT", style: kDefaultTextTitle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(sliderHeightValue.toString(),
                            style: kDefaultNumberTitle),
                        Text("cm", style: TextStyle(fontSize: 18.0)),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EA1556),
                        inactiveTrackColor: Colors.grey[800],
                        thumbColor: Color(0xffEA1556),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      ),
                      child: Slider(
                        value: sliderHeightValue.toDouble(),
                        min: 120,
                        max: 250,
                        onChanged: (double value) {
                          setState(() {
                            sliderHeightValue = value.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReUsableCard(
                      cardMargin: EdgeInsets.only(
                          top: 5.0, left: 30.0, right: 3.0, bottom: 30.0),
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("WEIGHT", style: kDefaultTextTitle),
                          Text(weight.toString(), style: kDefaultNumberTitle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                buttonIcon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight != 0 ? weight-- : weight = 0;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundedIconButton(
                                buttonIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight != 500 ? weight++ : weight = 500;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReUsableCard(
                      cardMargin: EdgeInsets.only(
                          top: 5.0, left: 3.0, right: 30.0, bottom: 30.0),
                      cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("AGE", style: kDefaultTextTitle),
                          Text(age.toString(), style: kDefaultNumberTitle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                buttonIcon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age != 0 ? age-- : age = 0;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundedIconButton(
                                buttonIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age != 150 ? age++ : age = 150;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BigBottomButton(
              buttonTitle: 'CALCULATE YOUR BMI',
              onPressed: () {
                CalculatorBrain calcBrain = new CalculatorBrain(sliderHeightValue, weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ResultsPage(
                      bmiResult: calcBrain.calculationBMI(),
                      resultText: calcBrain.getResult(),
                      interpretation: calcBrain.getInterpretation(),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
