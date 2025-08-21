void main() {
  Solution solution = Solution();
  print('result: ${solution.romanToInt('LVIII')}');
}

//13. 로마자에서 정수로
class Solution {
  //내 답안(185ms)=================================================================================
  int romanToInt(String s) {
    //I, V, X, L, C, D, M
    //1, 5, 10, 50, 100, 500, 1000-> 얘네는 바로 매칭할 수있음
    //I는 V(5)와 X(10) 앞에 위치하여 4와 9, X는 L(50)과 C(100) 앞에 위치하여 40과 90, C는 D(500)와 M(1000) 앞에 위치하여 400과 900을
    //앞에 나온 숫자보다 뒤에나온게 더 크면 빼고, 작으면 더하기

    Map<String, int> romMap = {
      'I': 1,
      'V': 5,
      'X': 10,
      'L': 50,
      'C': 100,
      'D': 500,
      'M': 1000,
    };
    int nowNum;
    int nextNum = 0;
    int total = 0;
    List<String> sList = s.split('');

    for (int i = 0; i < sList.length; i++) {
      nowNum = romMap[sList[i]] ?? 0;
      if (i + 1 < sList.length) {
        nextNum = romMap[sList[i + 1]] ?? 0;
      } else {
        nextNum = 0;
      }

      if (nowNum < nextNum) {
        total -= nowNum;
      } else if (nowNum >= nextNum) {
        total += nowNum;
      }

      print('nowNum $nowNum');
      print('nextNum $nextNum');
      print('total $total======================');
    }

    return total;
  }

  //정답(9ms)=================================================================================
  int romanToInt2(String s) {
    // 로마 숫자 문자와 해당 값들을 매핑하는 맵을 생성
    Map<String, int> romanToIntMap = {
      'I': 1,
      'V': 5,
      'X': 10,
      'L': 50,
      'C': 100,
      'D': 500,
      'M': 1000,
    };

    int total = 0;

    // 문자열을 순회하면서 로마 숫자 값을 계산
    for (int i = 0; i < s.length; i++) {
      int currentVal = romanToIntMap[s[i]]!;
      int nextVal = i + 1 < s.length ? romanToIntMap[s[i + 1]]! : 0;

      // IV
      // 현재 값이 다음 값보다 작으면 뺄셈, 그렇지 않으면 더함
      if (currentVal < nextVal) {
        total -= currentVal;
      } else {
        total += currentVal;
      }
    }

    return total;
  }
}
