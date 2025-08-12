void main() {
  Solution solution = Solution();
  print('result: ${solution.containsNearbyDuplicate([1, 2, 3, 1, 2, 3], 2)}');
}

//219. 중복된 값 포함 II
class Solution {
  //내답안:오답=====================================================
  bool containsNearbyDuplicate(List<int> nums, int k) {
    //nums중에 '같은 값' 을 가진 인덱스를 구하자
    Map<int, int> index = {};

    for (int i = 0; i < nums.length; i++) {
      if (!index.values.contains(nums[i])) {
        //Map에 숫자가 없으면
        index[i] = nums[i]; //인덱스의 i번째에 방금 들어온 숫자가 들어감
      } else {
        //있다면
        var firstentry = index.entries.firstWhere(
          (entry) => entry.value == nums[i],
        ); //index의
        var first = firstentry.key;
        var second = i;
        if ((second - first) <= k) {
          return true;
        }
      }
    }

    return false;
  }

  //정답================================================
  bool containsNearbyDuplicate2(List<int> nums, int k) {
    // 해시맵 생성 (숫자 -> 가장 최근 인덱스)
    Map<int, int> indexMap = {};

    // 배열 순회
    for (int i = 0; i < nums.length; i++) {
      // 만약 숫자가 해시맵에 존재하고 인덱스 차이가 k 이하라면 true 반환
      if (indexMap.containsKey(nums[i]) && (i - indexMap[nums[i]]!) <= k) {
        return true;
      }
      // 현재 숫자와 인덱스를 해시맵에 업데이트
      indexMap[nums[i]] = i;
    }

    // 조건을 만족하는 경우가 없으면 false 반환
    return false;
  }
}
