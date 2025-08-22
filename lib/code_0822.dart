import 'dart:math';

void main() {
  Solution solution = Solution();
  print('result: ${solution.canJump([2,5,0,0])}');
}
//55. 점프 게임
class Solution {
  //내 답안(오답임)=====================================================
  bool canJump(List<int> nums) {
    //nums에서 각 원소는 해당 인덱스에서 점프할 수 있는 최대 거리
    //현재 인덱스, 현재 인덱스의 숫자->이동할수있는 수, 마지막 인덱스를 알아야 하나
    int nowIn = 0;
    int jumpNum = -1;
    bool ing = false;

    for(int i=0; i<nums.length; i++){
      if(nowIn >= nums.length){return ing = true;} //현재 인덱스가 마지막 인덱스보다 클경우 true
      if(nowIn > i || jumpNum == 0){continue;} //현재 인덱스가 i번째 인덱스보다 클경우 or 이동할수있는 숫자가 0일경우 for문 넘어감 ->1번째 인덱스에서 넘어감 -> 2번째 인덱스에서
      
      jumpNum = nums[i]; //점프할수있는 숫자에 이번 인덱스의 숫자가 들어감 -> 2
      nowIn += jumpNum; //현재 인덱스에 점프할수있는 숫자 누적 -> 2

      print('jumpNum $jumpNum');
      print('nowIn $nowIn');
    }

    return ing;
  }

  //정답=====================================================
  bool canJump2(List<int> nums) {
        int maxReachable = 0; // 현재 도달 가능한 최대 인덱스
        
        for (int i = 0; i < nums.length; i++) {
            if (i > maxReachable) {
                return false; // 현재 인덱스가 최대 도달 가능 인덱스를 초과하면 false
            }
            maxReachable = max(maxReachable, i + nums[i]); // 최대 도달 인덱스 갱신
            if (maxReachable >= nums.length - 1) {
                return true; // 마지막 인덱스에 도달할 수 있으면 true
            }
        }
        
        return false; // 반복 후에도 도달할 수 없다면 false
    }

}