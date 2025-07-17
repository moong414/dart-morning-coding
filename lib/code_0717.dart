void main() {
  Solution solution = Solution();

  String haystack = "sadbutsad";
  String needle = "sad";

  print(solution.strStr(haystack, needle));
}

//28번 문자열에서 첫 번째로 나타나는 인덱스 찾기
class Solution {
  int strStr(String haystack, String needle) {
    //needle의 전체 문자가 순서에 맞게, haystack에 들어가있어야함
    //그 첫번째 문자의 인덱스를 알아야함
    if (haystack.contains(needle)) {
      int index = haystack.indexOf(needle);
      return index;
    } else {
      return -1;
    }
  }
  //내가 쓴 답↑↑↑↑
  //정답==============================================
  int strStr2(String haystack, String needle) {
    return haystack.indexOf(needle);
  }
  //정답==============================================
  int strStr3(String haystack, String needle) {
    if(needle.length > haystack.length) return -1;

    for(int i = 0; i<= haystack.length - needle.length; i++){
      String str = '';
      for(int j = 0; j < needle.length; i++){
        str += haystack[i + j];
      }
      if(str == needle) return i;
    }

    return -1;
  }


}
