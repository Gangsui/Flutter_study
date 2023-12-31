// Put your code here
int answer_(String good) {
  List <String> value1 = ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' ];
  List <String> value2 = ['D', 'G'  ];
  List <String> value3 = ['B', 'C', 'M', 'P'  ];
  List <String> value4 = ['F', 'H', 'V', 'W', 'Y' ];
  List <String> value5 = ['K'];
  List <String> value8 = ['J', 'X'  ];
  List <String> value10 = ['Q', 'Z' ];
  int answer = 0;
  

  
  
  for (int i =0; i< good.length; i++)
  {
    if (value1.contains(good[i])){
      answer += 1;
    }
    else if (value2.contains(good[i]))
    {
      answer += 2;
      
    }
     else if (value3.contains(good[i]))
    {
      answer += 3;
      
    }
    else if (value4.contains(good[i]))
    {
      answer += 4;
      
    }
     else if (value5.contains(good[i]))
    {
      answer += 5;
      
    }
     else if (value8.contains(good[i]))
    {
      answer += 8;
      
    }
    else if (value10.contains(good[i]))
    {
      answer += 10;
      
    }
    
  }
  return answer;
  
}

