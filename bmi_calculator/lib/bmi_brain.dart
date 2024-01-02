
import 'dart:math';

class BmiBrain{

  BmiBrain({required this.height, required this.weight});

  final int height;
  final int weight;


  double _bmi =0;

  String calculate(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }


  String resultType(){
    if (_bmi >25) {
      return 'Overweight';
    }else if(_bmi >18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }
  String getinter(){
    if (_bmi >25) {
      return '운동하세요';
    }else if(_bmi >18.5){
      return '이 몸무게를 유지하세요';
    }
    else{
      return '많이 드세요';
    }
  }

}