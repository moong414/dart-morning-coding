import 'dart:math';

void main() {
  Solution solution = Solution();
  print(
    'result: ${solution.maxArea2([1, 8, 6, 2, 5, 4, 8, 3, 7])}',
  );
}

//11. 물이 가장 많은 용기
class Solution {
  //내풀이: 오답======================================================
  int maxArea(List<int> height) {
    //배열을 하나씩 탐색
    //인덱스의 차가 제일 많은거랑,,인덱스 차는 어떻게 구하죠
    //숫자가 제일 높은거를 동시에 구해야할듯..
    int maxNum = 0;
    int maxMinus = 0;

    for (int i = 0; i < height.length; i++) {
      for (int j = height.length - 1; j > 0; j--) {
        if (maxNum < (height[i] * height[j]) && maxMinus < i - j) {
          maxNum = height[i] * height[j];
          maxMinus = i - j;
        }
      }
    }

    return maxNum;
  }

  //정답======================================================
  int maxArea2(List<int> height) {
    int left = 0;
    int right = height.length - 1;
    int maxArea = 0;

    while (left < right) {
      int currentHeight = min(height[left], height[right]);
      int currentArea = currentHeight * (right - left);
      maxArea = max(maxArea, currentArea);

      // 낮은 높이의 포인터를 움직여 더 높은 영역을 찾음
      if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }

    return maxArea;
  }

  
}
