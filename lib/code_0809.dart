void main() {
  Solution solution = Solution();
  print('result: ${solution.reverseVowels("leetcode")}');
}

//345. 문자열의 역모음
// 주어진 문자열 s에서 모음(‘a’, ‘e’, ‘i’, ‘o’, ‘u’, 대소문자 구분 없음)들만 뒤집어서 문자열을 반환하세요.
// 다른 문자는 원래 위치에 그대로 남아 있어야 합니다.
class Solution {
  String reverseVowels(String s) {
    List<String> sList = s.split('');
    List<String> vowel = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
    List<String> thisVowel = [];
    
    for(int i=0; i<sList.length; i++){
      print('지금들어온 값 ${sList[i]}');
      if(vowel.contains(sList[i])){
        thisVowel.add(sList[i]);
        sList[i] = '_';
      }
      print('sList: $sList');
      print('thisVowel: $thisVowel');
    }

    thisVowel = thisVowel.reversed.toList();
    print('들어온 순서 뒤집음: $thisVowel');
    for(int j=0; j<thisVowel.length; j++){
      int idx = sList.indexOf('_');
      if(idx != -1){
        sList[idx] = thisVowel[j];
      }
    }

    return sList.join();
  }

  //정답================================================================================
  String reverseVowels2(String s) {
  // 모음 리스트
  final vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
  
  // 문자열을 리스트로 변환해 수정 가능하게 만듬
  List<String> chars = s.split('');
  
  // 투 포인터 방식으로 앞에서와 뒤에서 모음을 찾아 교체
  int left = 0;
  int right = s.length - 1;
  
  while (left < right) {
    // 왼쪽에서 모음을 찾음
    while (left < right && !vowels.contains(chars[left])) {
      left++;
    }
    
    // 오른쪽에서 모음을 찾음
    while (left < right && !vowels.contains(chars[right])) {
      right--;
    }
    
    // 두 모음을 교환
    if (left < right) {
      String temp = chars[left];
      chars[left] = chars[right];
      chars[right] = temp;
      
      left++;
      right--;
    }
  }
  
  // 리스트를 다시 문자열로 변환
  return chars.join('');
}

}