void main() {
  print(anagram('anagram', 'nagaram'));
}

//유효한 애너그램
bool anagram(String s, String t) {
  List sList = s.split('');
  List tList = t.split('');
  var findSword = sList.every((sWord) => tList.contains(sWord));
  return findSword;
}


//정답=====================================================
bool anagram2(String s, String t) {
  //단어를 split으로 하나하나 쪼개서 리스트로 반환
  //.sort는 void를 돌려줌★★★
  //..sort로 정렬과 동시에 리스트로 돌려줌★★★

  //[a, a, a, g, m, n, r]
  var list1 = s.split('')..sort();
  //[a, a, a, g, m, n, r]
  var list2 = s.split('')..sort();

  // =는 int, String, bool, double은 값을 비교하고 / 나머지는 주소를 비교한다.
  //그러므로 return list1 == list2; 는 쓰지못한다.★★★
  //join는 String을 돌려주므로 list1과 list2가 같은지 비교할수있다.
  return list1.join() == list2.join();
}

//소거법
bool anagram3(String s, String t) {
  //먼저 두 글자의 길이가 같은지 비교
  if(s.length != t.length) return false;

  //카운터용 맵을 만듦
  Map<String, int> counter = {};

  //s를 한글자씩 쪼개서 그 한글자를
  for(var char in s.split('')){
    //한글자씩 비교해서 counter에 char를 보낸다
    //똑같은 글자가 오면 +1을 한다
    counter[char] = (counter[char] ?? 0) + 1;
  }

  //그다음 t를 한글자씩 쪼개서
  for(var char in t.split('')){
    //t의 글자가 카운터에 들어가있지않거나 or 카운터에서 t의 글자가 0이거나 하면 false반환 ??
    if(!counter.containsKey(char) || counter[char]! == 0) return false;
    counter[char] = counter[char] ! - 1;
  }

  return true;
}