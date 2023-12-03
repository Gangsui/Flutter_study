import 'question.dart';

class QuizBrain{

  int _number = 0;
  List<QuizInformation> _questionbank = [QuizInformation('달팽이도 이빨이 있다.',true),
  QuizInformation('세계에서 제일 처음으로 텔레비전 방송을 시작한 나라는 영국이다.',true),
  QuizInformation('말도 잠을 잘 때는 사람과 같이 코를 곤다..',true),
    QuizInformation('셰익스피어 희곡 햄릿의 주인공인 햄릿은 네덜란드 사람이다.',false),
    QuizInformation('여의도 국회의사당을 둘러 ?고 있는 돌기둥의 수는 모두 24개이다.',true),
    QuizInformation('아라비아 숫자 1부터 100사이에는 9라는 숫자가 모두 19개 들어 있다. ',false),
    QuizInformation('전쟁시 여자아이보다 남자아이의 출생률이 높다.',true),
    QuizInformation('세계적으로 가장 많이 발생하는 병은 말라리아 (학질) 이다.',false),
    QuizInformation('세계 최초의 신용카드는 아메리칸 익스프레스이다.',false),
    QuizInformation('조선시대 호패는 (주민등록증) 16세 이상 모든 남녀가 소지했다.',false),
    QuizInformation('우리나라 최초의 대중가요는 1923년부터 불리워진 ‘희망가’이다.',false),
    QuizInformation('용은 십장생의 하나다.',false),
  ];

  void currentNumber(){

    if (_number < _questionbank.length-1){
      _number++;
    }
  }


  String getQuestion() => _questionbank[_number].question;

  bool checkQuestion() => _questionbank[_number].answer;




}