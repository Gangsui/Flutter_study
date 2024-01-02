import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/roundBotton.dart';
import '../components/bottonButton.dart';
import 'package:bmi_calculator/bmi_brain.dart';

enum Gender { women, men }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height_check = 180;
  int weight_check = 60;
  int age_check = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.men;
                      });
                    },
                    colour: selectedGender == Gender.men
                        ? kActivateColor
                        : kInactivateColor,
                    ReuserableCard: insideIcon(
                      iconInside: FontAwesomeIcons.mars,
                      strInside: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.women;
                      });
                    },
                    colour: selectedGender == Gender.women
                        ? kActivateColor
                        : kInactivateColor,
                    ReuserableCard: insideIcon(
                      iconInside: FontAwesomeIcons.venus,
                      strInside: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kInactivateColor,
              ReuserableCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLabelTextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height_check.toString(),
                        style: kRestTextstyle,
                      ),
                      Text('cm')
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                        value: height_check.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Colors.redAccent.shade400,
                        onChanged: (double height) {
                          setState(() {
                            height_check = height.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactivateColor,
                    ReuserableCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight_check.toString(),
                              style: kRestTextstyle,
                            ),
                            Text('kg'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundClick(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight_check -= 1;
                                });
                              },
                            ),
                            RoundClick(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight_check += 1;
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
                  child: ReusableCard(
                    colour: kInactivateColor,
                    ReuserableCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kLabelTextstyle,
                        ),
                        Text(
                          age_check.toString(),
                          style: kRestTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundClick(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age_check -= 1;
                                });
                              },
                            ),
                            RoundClick(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age_check += 1;
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
          BottomButton(onTap: () {
            BmiBrain calc = BmiBrain(height:height_check,weight: weight_check );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  resultmiddisplay: calc.calculate(),
                  resultBotoodisplay: calc.getinter(),
                resultTopdisplay: calc.resultType(),),
              ),
            );
          },
          bottomText: 'CALCULATE',),
        ],
      ),
    );
  }
}


