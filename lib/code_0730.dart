import 'dart:collection';

void main() {
  Solution solution = Solution();

  solution.rotate([1, 2, 3, 4, 5, 6, 7], 3);
}

// 189. 배열 회전
// 주어진 정수 배열 nums를 오른쪽으로 k번 회전 (마지막 요소를 배열의 처음으로 이동시킴)
class Solution {
  void rotate(List<int> nums, int k) {
    int lastInt = 0;
    //먼저 마지막 요소를 알수있어야 하고, 마지막 요소를 첫번째 자리로 옮겨야함 & k번 반복해야함

    for (int i = 0; i < k; i++) {
      lastInt = nums.last; //마지막요소를 last변수에 할당
      nums.removeLast(); //마지막 요소를 삭제
      nums.insert(0, lastInt); //첫번째에 last 넣기
    }

    print(nums);
  }

  //내 답안1.타임리밋이 걸려버림↑↑↑↑
  //정답================================================================
  void rotate3(List<int> nums, int k) {
    //Find real k
    k %= nums.length;
    //examination
    if (nums.length > 1 && k > 0) {
      //Create new array with numbers that should be moved to the beginning
      List<int> result = nums.getRange(nums.length - k, nums.length).toList();
      //add remaining numbers
      for (var i = 0; i < nums.length - k; i++) {
        result.add(nums[i]);
      }
      nums.removeRange(0, nums.length);
      nums.insertAll(0, result);
    }
  }


}
