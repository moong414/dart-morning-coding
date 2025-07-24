void main() {
  Solution solution = Solution();
  List<int> arr = [1, 2, 2, 1, 1, 3];
  print(solution.uniqueOccurrences(arr));
}

//1207. 고유한 빈도 횟수
class Solution {
  //내가 쓴 답↓↓↓↓↓
  bool uniqueOccurrences(List<int> arr) {
    //각 원소의 빈도가 모두 다르면 true, 아니면 false
    //Map을 이용해서 key값은 들어오는 숫자, value값은 그 숫자의 갯수를 세야함

    Map<int, int> newMap = {}; //새로운 Map
    for (int arrNum in arr) {
      //리스트를 돌려가면서
      if (newMap.containsKey(arrNum)) {
        //key에 리스트의 숫자가 들어가있는지
        newMap[arrNum] = newMap[arrNum]! + 1; //들어가있다면 +1
      } else {
        newMap[arrNum] = 1; //안들어가 있다면 1
      }
    }

    //Key값과 Value값을 각각 Set으로 바꿔서, value가 Set에 들어가면 중복이되니까
    //Key의 length과 Value의 length가 달라질것임
    Set<int> keySet = newMap.keys.toSet();
    Set<int> valueSet = newMap.values.toSet();

    //둘의 갯수가 다르면 중복횟수가 있다는 뜻이므로 false반환
    if (keySet.length != valueSet.length) {
      return false;
    }

    return true;
  }

  //정답====================================================
  bool uniqueOccurrences2(List<int> arr) {
    if (arr.length == 1) {
      return true;
    }

    Map<int, int> countMap = {};
    Set<int> uniqueCounts = {};

    for (int num in arr) {
      countMap[num] = (countMap[num] ?? 0) + 1;
    }

    for (int count in countMap.values) {
      uniqueCounts.add(count);
    }

    return countMap.length == uniqueCounts.length;
  }

  //정답==========================================
  bool uniqueOccurrences3(List<int> arr) {
    // 각 원소의 빈도수를 저장하는 Map
    Map<int, int> frequencyMap = {};

    // 빈도수 계산
    for (int num in arr) {
      frequencyMap[num] = (frequencyMap[num] ?? 0) + 1;
    }

    // 빈도 리스트 생성
    List<int> frequencies = frequencyMap.values.toList();

    // 빈도의 고유성 검사
    return frequencies.length == frequencies.toSet().length;
  }
}
