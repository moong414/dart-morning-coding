void main() {
  Solution solution = Solution();
  print('result: ${solution.kidsWithCandies([2,3,5,1,3], 3)}');
}

class Solution {
  //1431. 가장 많은 사탕을 가지고 있는 아이들
  //내 답안==========================================================
  List<bool> kidsWithCandies(List<int> candies, int extraCandies) {
    //배열의 최대값 구하기
    int max = candies.reduce((thismax, num){
      if(thismax < num){
        return num;
      }else{
        return thismax;
      }
    });

    print('쵀대값: $max');

    List<bool> canList = candies.map((candy){
      if(candy+extraCandies >= max){
        return true;
      }
      return false;
    }).toList();

    return canList;
  }

  //정답==========================================================
  List<bool> kidsWithCandies2(List<int> candies, int extraCandies) {
  // 가장 많은 사탕을 가진 아이의 사탕 수를 찾음
  int maxCandies = candies.reduce((a, b) => a > b ? a : b);
  
  // 각 아이가 사탕을 더했을 때 최대 사탕을 가질 수 있는지 확인
  return candies.map((candy) => candy + extraCandies >= maxCandies).toList();
}
}