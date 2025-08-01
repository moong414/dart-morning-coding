void main() {
  Solution solution = Solution();
  print(solution.removeDuplicates([1, 1, 1, 2, 2, 3]));
}

// 80. 정렬된 배열에서 중복 제거 II
class Solution {
  //각 요소가 최대 2번까지, 나머지는 삭제, 제거후의 배열의 순서 그대로
  // int removeDuplicates(List<int> nums) {
  //   Map<int, int> dupMap = {};

  //   //각 요소의 갯수세기
  //   for(int num in nums){
  //     if(dupMap.containsKey(num)){
  //       dupMap[num] =  dupMap[num]! + 1;
  //     }else{
  //       dupMap[num] = 0;
  //     }
  //   }

  //   //3이상인 놈은 제거
  //   nums.removeWhere((element) {

  //   },);

  // }
  // 못풀었음..
  //정답============================================================
  int removeDuplicates(List<int> nums) {
    if (nums.isEmpty) return 0; // 배열이 비어있으면 0 반환

    int k = 1; // 유효한 요소의 개수를 셀 포인터
    int count = 1; // 현재 숫자의 개수를 세는 변수

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] == nums[i - 1]) {
        count++; // 현재 숫자가 이전 숫자와 같으면 카운트 증가
      } else {
        count = 1; // 다른 숫자가 나오면 카운트를 1로 리셋
      }

      if (count <= 2) {
        // 카운트가 2 이하일 때만 유효 위치에 배치
        nums[k] = nums[i]; // 유효 위치에 현재 숫자 배치
        k++; // 유효 요소 개수 증가
      }
    }

    return k; // 유효한 길이를 반환
  }
}
