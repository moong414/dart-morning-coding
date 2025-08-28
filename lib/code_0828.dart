void main() {
  Solution solution = Solution();
  print(
    'result: ${solution.lengthOfLongestSubstring('abcabcbb')}=======================================',
  );
}
//3. 반복되지 않는 가장 긴 부분 문자열
class Solution {
  //정답=========================================================

  int lengthOfLongestSubstring(String s) {
  Map<String, int> charIndexMap = {};
  int maxLength = 0;
  int windowStart = 0;

  for (int windowEnd = 0; windowEnd < s.length; windowEnd++) {
    String currentChar = s[windowEnd];

    // 중복 문자 발견 시, windowStart 갱신
    if (charIndexMap.containsKey(currentChar) && charIndexMap[currentChar]! >= windowStart) {
      windowStart = charIndexMap[currentChar]! + 1;
    }

    // 현재 문자 위치 갱신
    charIndexMap[currentChar] = windowEnd;

    // 최대 길이 갱신
    maxLength = (windowEnd - windowStart + 1).clamp(maxLength, s.length);
  }

  return maxLength;
}

}