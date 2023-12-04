import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_bring.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {

  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Widget> scoreK = [];

  QuizBrain questionbank = QuizBrain();
  int rightAnswer = 0;
  int bottomCount = 0;

  void checkAnswer(bool check){

    bool correctAnswer = questionbank.checkQuestion();

    setState(() {
      if (bottomCount > 12){
        scoreK.removeRange(0,10);
        bottomCount = 3;
      }

      if (correctAnswer == check){
        scoreK.add(Icon(Icons.check,color: Colors.green,));
        rightAnswer++;
        bottomCount++;
      }else {
        scoreK.add(Icon(Icons.close,color: Colors.red,));
        bottomCount++;
      }
      questionbank.currentNumber(context,rightAnswer);


    });
  }

  int quizNumber =0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionbank.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FilledButton(


              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),

              onPressed: () {
                checkAnswer(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FilledButton(
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(true);

              },
            ),
          ),
        ),
        Row(
          children: scoreK,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/