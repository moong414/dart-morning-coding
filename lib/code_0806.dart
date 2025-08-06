void main() {
  Solution solution = Solution();
  print(solution.isSubsequence('abc', 'ahbgdc'));
}

//392. 부분 수열
class Solution {
  bool isSubsequence(String s, String t) {
    //s의 순서대로 t에 들어가있는지 확인하는 문제
    int nowNum = 0;
    if (s.isEmpty && t.isEmpty) return true;
    for (int i = 0; i < t.length; i++) {
      if (s.isEmpty) return true;

      if (s[nowNum] == t[i]) {
        nowNum++;
        if (nowNum == s.length) {
          return true;
        }
      }
    }
    return false;
  }

  //정답=============================================
  bool isSubsequence2(String s, String t) {
    int sIndex = 0;
    int tIndex = 0;

    // 문자열 t를 탐색하며 s의 모든 문자가 순서대로 있는지 확인
    while (sIndex < s.length && tIndex < t.length) {
      if (s[sIndex] == t[tIndex]) {
        sIndex++;
      }
      tIndex++;
    }

    // s의 모든 문자를 찾은 경우 true
    return sIndex == s.length;
  }

  //튜터님정답=============================================
  bool isSubsequence3(String s, String t) {
    if (s.isEmpty) return true;
    if (t.isEmpty) return true;

    int sIndex = 0;

    for (int i = 0; i < t.length; i++) {
      if (s[sIndex] == t[i]) {
        sIndex++;

        if (sIndex == s.length) {
          return true;
        }
      }
    }
    return false;
  }
}
