void main() {
  List<String> strs = ["flower","flow","flight"];
  Solution solution = Solution();
  print(solution.longestCommonPrefix(strs));
}

//14. 가장 긴 공통 접두사(문자열)
//정답=====================================================================================================
class Solution {
  String longestCommonPrefix(List<String> strs) {
    if (strs.isEmpty) return "";

    // 첫 번째 문자열을 기준으로 공통 접두사를 찾는다
    String prefix = strs[0];

    for (int i = 1; i < strs.length; i++) {
      // 각 문자열에서 접두사를 비교하여 갱신
      while (!strs[i].startsWith(prefix)) {
        // 접두사가 맞지 않으면 하나씩 접두사 길이를 줄여간다
        prefix = prefix.substring(0, prefix.length - 1);
        if (prefix.isEmpty) return ""; // 공통 접두사가 없으면 빈 문자열 반환
      }
    }

    return prefix;
  }
}