import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.resultBotoodisplay, required this.resultmiddisplay, required this.resultTopdisplay });
  final String resultTopdisplay;
  final String resultmiddisplay;
  final String resultBotoodisplay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI_Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your result',
                style: kresultTop,
              ),
              padding: EdgeInsets.only(top: 20.0,bottom: 10.0),
              alignment: Alignment.center,

            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActivateColor,
              ReuserableCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultTopdisplay,
                    style: kresultInTop,
                  ),
                  Text(
                    resultmiddisplay,
                    style: kresultInmiddle,
                  ),
                  Text(
                    resultBotoodisplay,
                    style: kresultInbottom,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
