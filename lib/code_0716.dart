void main() {
  List<int> nums = [1, 7, 3, 6, 5, 6];
  Solution solution = Solution();

  print(solution.pivotIndex(nums));
}

//724 피벗 인덱스 찾기
class Solution {
  //↓↓↓↓내가 쓴 답
  int pivotIndex(List<int> nums) {
    //먼저 리스트를 돌면서 어떤 인덱스를 기준으로 왼쪽과 오른쪽을 잘라야 하나?
    //잘라서 왼쪽값을 더하고 오른쪽값을 더하고
    //그 수가 일치하면 반복문이 끝나고
    //아니면 계속 돌고
    int? index;

    for (int i = 0; i < nums.length; i++) {
      int leftSum = 0;
      int rightSum = 0;
      List<int> left = [];
      List<int> right = [];

      left = nums.sublist(0, i);
      right = nums.sublist(i + 1, nums.length);

      left.forEach((n) => leftSum += n);
      right.forEach((n) => rightSum += n);

      if (leftSum == rightSum) {
        return index = i;
      }
    }

    return index ?? -1;
  }

  //정답===========================================================================
  int pivotIndex2(List<int> nums) {
    int totalSum = nums.reduce((a, b) => a + b);
    int leftSum = 0;

    for (int i = 0; i < nums.length; i++) {
      int rightSum = totalSum - leftSum - nums[i];
      if (leftSum == rightSum) {
        return i;
      }
      leftSum += nums[i];
    }

    return -1;
  }


}
