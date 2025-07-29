import 'dart:math';

void main() {
  Solution solution = Solution();
  print(solution.findMaxAverage([1, 12, -5, -6, 50, 3], 4));
}

//643. 최대 평균 하위 배열
class Solution {
  //못풀었음...
  //정답===============================================================
  double findMaxAverage(List<int> nums, int k) {
    int sum = 0;

    // 첫 번째 k개의 요소 합 계산

    // [1,12,-5,-6,50,3] , k = 4
    // [1,12,-5,-6]
    for (int i = 0; i < k; i++) {
      sum += nums[i];
    }
    // sum = 2

    int maxSum = sum;
    //  maxSum = 2

    // 슬라이딩 윈도우를 사용하여 최대 합 계산
    for (int i = k; i < nums.length; i++) {
      sum = sum - nums[i - k] + nums[i];
      maxSum = max(maxSum, sum);
    }

    // i : 4,

    // [1,12,-5,-6,50,3] -> [1,12,-5,-6]
    // [1,12,-5,-6,50,3] -> [1,12,-5,-6] -> [12,-5,-6] -> [12,-5,-6,50]
    // [1,12,-5,-6,50,3] -> [12,-5,-6,50]

    // sum = 2 - 1 + 50 == 51

    // maxSum = 51

    return maxSum / k;
  }


  //튜터님정답=====================================
  double findMaxAverage2(List<int> nums, int k) {

    double currentSum = 0;

    for(int i=0; i<k; i++){
      currentSum += nums[i];
    }

    double maxSum = currentSum;

    for(int i = k; i<nums.length; i++){
      currentSum = currentSum - nums[i - k] + nums[i];

      if(currentSum > maxSum){
        maxSum = currentSum;
      }

    }

    return maxSum / k;
    
  }
}
