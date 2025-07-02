void main() {
  print(lengthOfLastWord('luffy is still joyboy'));
}

//마지막 단어의 길이 구하기
int lengthOfLastWord(String s) {
  var thislist = s.trim().split(' ');
  int number = thislist.last.length;
  return number;
}

//정답=====================================================
// solved 1
class Solution {
  int lengthOfLastWord(String s) {
	  // trim() -> 앞 뒤의 공백 제거(제거된 새 문자열 반환)
	  // split(String seperator) -> 문자열에서 seperator를 기준으로 분리한다. 배열이 반환됨
    var splitString = s.trim().split(' ');
    // hello world -> ["hello", "world"]
    
    // List.first (List[0]) or List.last( => List[List.length - 1])

    return splitString.last.length;
  }
}

// solved 2
class Solution2 {
  int lengthOfLastWord(String s) {
    String res = "";
    
    //i는 문자열 길이의 -1값, 즉 마지막 글자부터 시작
    for (var i = s.length-1; i >=0; i--) {
      //마지막글자부터 시작해서 찾은 i번째 단어가 공백이고, res라는 변수가 비어있지않으면, res의 길이값을 반환
      //처음에는 공백이지만, res라는 변수가 비어있으므로 이 if문은 무시됌-> 언제까지 무시되냐? 공백을 만날때까지.
      if(s[i]== " " && res.isNotEmpty) return res.length; 
      
      //i번째가 공백이면 하단의 코드가 진행되지않고 for문 진행-> 즉 공백은 res변수에 들어가지않음
      if(s[i] == " ") {
        continue;
      }

      //i번째가 공백이 아니라면 res에 i번째 문자 넣기-> 공백을 무시한 문자는 res에 차례차례 저장됨 -> 언제까지? 가장 상단의 if문이 만족될때까지
      res+= s[i];
    }

    return res.length;
  }
}

// solved 3
class Solution3 {
  int lengthOfLastWord(String s) {
    int length = 0;
    int i = s.length - 1;

    while(i >= 0 && s[i] == ' '){
      i--;
    }

    while(i >= 0 && s[i] != ' '){
      length++;
      i--;
    }

    return length;
  }
}

