void main() {
  Solution solution = Solution();
  print('result: ${solution.wordPattern("abba", "dog dog dog dog")}');
}

//290. 단어 패턴
//오답==========================================
class Solution {
  bool wordPattern(String pattern, String s) {
    List<String> patternList = pattern.split('');
    List<String> wordsList = s.split(' ');
    Map<String, String> map = {};

    if (patternList.length != wordsList.length) {
      return false; //두개의 길이가 같지않으면 false
    }

    for (int i = 0; i < patternList.length; i++) {
      //a와 dog이 들어오고
      if (!map.containsKey(patternList[i])) {
        //key에 a라는 글자가 없으면
        map.addAll({patternList[i]: wordsList[i]}); //넣기
      } else {
        //있으면
        if (map[patternList[i]] != wordsList[i]) {
          //두개가 같지않으면
          return false;
        }
        //         if(map.containsValue(wordsList[i])){//value가 같은지
        //           continue;
        //         }else{
        //           return false;
        //         }
      }

      print(map);
    }

    return true;
  }

  //정답==========================================
  bool wordPattern2(String pattern, String s) {
    List<String> words = s.split(' ');

    if (pattern.length != words.length) return false;

    Map<String, String> charToWord = {};
    Map<String, String> wordToChar = {};

    // charToWord = { a : 'cat' }
    // wordToChar = { cat : 'a' }

    // pattern == 'abba'
    // s == 'cat dog dog cat'
    for (int i = 0; i < pattern.length; i++) {
      String char = pattern[i];
      String word = words[i];

      if (charToWord.containsKey(char)) {
        if (charToWord[char] != word) return false;
      } else {
        charToWord[char] = word;
      }

      if (wordToChar.containsKey(word)) {
        if (wordToChar[word] != char) return false;
      } else {
        wordToChar[word] = char;
      }
    }

    return true;
  }
}
