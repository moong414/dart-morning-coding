void main() {
  Solution solution = Solution();
  print('result: ${solution.largestAltitude([-5,1,5,0,-7])}');
}
//1732. 가장 높은 고도 찾기
class Solution {
  //내 답안================================================================
  int largestAltitude(List<int> gain) {
    //들어온 리스트가 누적이 되야함
    //누적된 숫자중에서 가장 큰 수를 돌려줘야함
    List<int> sumList = [0]; 
    int thisNum = 0; //현재 수
    int maxNum = 0; //가장 높은 수

    for(int i=0; i<gain.length; i++){
      thisNum = thisNum + gain[i];
      sumList.add(thisNum);
      if(thisNum > maxNum){
        maxNum = thisNum;
      }
    }
    return maxNum;
  }

  //정답================================================================
  int largestAltitude2(List<int> gain) {
  int maxAltitude = 0;
  int currentAltitude = 0;

  for (int change in gain) {
    currentAltitude += change;
    if (currentAltitude > maxAltitude) {
      maxAltitude = currentAltitude;
    }
  }

  return maxAltitude;
}
}