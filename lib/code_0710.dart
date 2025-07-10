void main() {
  List<int> case1 = [1, 1, 2];
  List<int> case2 = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4];

  Solution solution = Solution();
  print(solution.removeDuplicates(case1));
  print(solution.removeDuplicates(case2));
}
//26. 정렬된 배열에서 중복 제거
//리턴은 정수, 중복을 제거하고 남은 배열은 어떤것이 남아도 됨
class Solution {
  int removeDuplicates(List<int> nums) {
    int checkDup = -1;
    int result = 0;

    for (int i = 0; i < nums.length; i++) {
      if (checkDup == nums[i]) {
        nums[i] = -1;
      } else {
        checkDup = nums[i];
      }
    }
    //0, -1, 1, -1, -1, 2, -1, 3, -1, 4

    nums.removeWhere((num) {
      return num == -1;
    });
    //-1이면 리스트에서 지움

    result = nums.length;
    return result;
  }
  // ↑↑↑ -1이 들어올경우 중복제거가 안됨. 오답 ↑↑↑

  //정답===================================================================
  int removeDuplicates2(List<int> nums) {
    Map<int, int> map = {};

    for (int i = 0; i < nums.length; i++) {
      if (!map.containsKey(nums[i])) {
        map[nums[i]] = 1;
      }
    }

    int len = nums.length;
    nums.clear();
    for (var entry in map.keys) {
      nums.add(entry);
    }

    for (int i = 0; i < len - map.keys.length; i++) {
      nums.add(0);
    }

    return map.keys.length;
  }

  //정답2===================================================================
  int removeDuplicates3(List<int> nums) {
    if (nums.isEmpty) return 0;

    int index = 1;

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] != nums[i - 1]) {
        nums[index] = nums[i];
        index++;
      }
    }
    return index;
  }
}
