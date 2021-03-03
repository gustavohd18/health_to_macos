import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_to_macos/pages/results_page.dart';
import 'package:health_to_macos/service/calculator_brain.dart';
import 'package:health_to_macos/widgets/BottomButton/bottom_button.dart';
import 'package:health_to_macos/widgets/CardInformation/card_information.dart';
import 'package:health_to_macos/widgets/GenreInformation/genre_information.dart';
import 'package:health_to_macos/widgets/roundIcon/round_icon_button.dart';

import '../constants.dart';


const selectedColor = Color(0xFF111328);
const color = Color(0xFF1D1E33);

enum Genrer { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genrer selectedGenre;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: CardInformation(
                  onPress: () {
                    setState(() {
                      selectedGenre = Genrer.male;
                    });
                  },
                  color: selectedGenre == Genrer.male ? selectedColor : color,
                  child: GenreInfomation(
                    text: "Male",
                    icon: Icon(
                      FontAwesomeIcons.mars,
                      size: 80,
                    ),
                    padding: EdgeInsets.only(left: 15),
                  ),
                ),
              ),
              Expanded(
                  child: CardInformation(
                onPress: () {
                  setState(() {
                    selectedGenre = Genrer.female;
                  });
                },
                color: selectedGenre == Genrer.female ? selectedColor : color,
                child: GenreInfomation(
                  text: "FEMALE",
                  icon: Icon(
                    FontAwesomeIcons.venus,
                    size: 80,
                  ),
                  padding: EdgeInsets.only(left: 5),
                ),
              )),
            ]),
          ),
          Expanded(
            child: CardInformation(
              color: color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF8D8E98),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "$height",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 50),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 250,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.toInt();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: CardInformation(color: Color(0xFF1D1E33),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                
                ),
              ),
              Expanded(child: CardInformation(color: Color(0xFF1D1E33),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
              ),
            ]),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
