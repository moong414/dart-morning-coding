void main() {
  Solution solution = Solution();
  List<int> cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1];
  print(solution.minCostClimbingStairs(cost));
}

//746. 계단을 올라가는 최소 비용
class Solution {
  //내 답안↓↓↓↓오답
  int minCostClimbingStairs(List<int> cost) {
    //비용을 적립할 변수
    int sum = 0;

    //cost의 길이를 구할 변수(2계단씩 올라갈 때)
    int costLen = cost.length;

    for (int i = 0; i < costLen - 1; i++) {
      //한번에 2개씩 비교
      int a = cost[i];
      int b = cost[i+1];
      
      if(a < b){
        //첫번째꺼가 작으면 1계단 올라간것
        sum += a;
      }else{
        //두번째꺼가 작으면 2계단 올라간것
        sum += b;
        costLen -= 1;
      }

    }
    return sum;
  }

  //정답========================================================
}
