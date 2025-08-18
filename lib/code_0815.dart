void main() {
  Solution solution = Solution();
  print('result: ${solution.isIsomorphic("bbbaaaba", "aaabbbba")}');
}

//205. 동형 문자열
class Solution {
  //정답================================================
  bool isIsomorphic(String s, String t) {
    // 가드 패턴
    if (s.length != t.length) return false;

    Map<String, String> mapST = {};
    Map<String, String> mapTS = {};

    for (int i = 0; i < s.length; i++) {
      String charS = s[i];
      String charT = t[i];

      if (mapST.containsKey(charS)) {
        if (mapST[charS] != charT) return false;
      } else {
        mapST[charS] = charT;
      }

      if (mapTS.containsKey(charT)) {
        if (mapTS[charT] != charS) return false;
      } else {
        mapTS[charT] = charS;
      }
    }

    return true;
  }
}
