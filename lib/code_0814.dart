void main() {
  Solution solution = Solution();
  print('result: ${solution.canConstruct("a", "b")}');
}
//383. 랜섬노트
class Solution {
  //내답안(오답)===================================================================
  bool canConstruct(String ransomNote, String magazine) {
    List<String> ranList = ransomNote.split('');
    List<String> magList = magazine.split('');
    int index = -1;

    if(ransomNote.length > magazine.length){return false;}

    for(String ran in ranList){
      index = -1;
      if(magList.isEmpty) return false;

      index = magList.indexWhere((e)=> e == ran);

      print('index $index');
      
      if(index == -1){return false;}
      magList.removeAt(index);

      print('magList $magList');
    }
    
    print('ranList $ranList');
    

    return true;
  }

  //정답================================================================
  bool canConstruct2(String ransomNote, String magazine) {
  List<int> charCount = List.filled(26, 0);
  
  for (int i = 0; i < magazine.length; i++) {  
    charCount[magazine.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
  }
  
  for (int i = 0; i < ransomNote.length; i++) {
    int index = ransomNote.codeUnitAt(i) - 'a'.codeUnitAt(0);
    if (charCount[index] == 0) {
      return false;
    }
    charCount[index]--;
  }
  
  return true;
}
}