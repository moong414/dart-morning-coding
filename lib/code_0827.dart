void main() {
  Solution solution = Solution();
  print(
    'result: ${solution.canPlaceFlowers([0,0,0,0,0,1,0,0], 0)}=======================================',
  );
}
// 605. 꽃 심기
class Solution {
  //내답안================================================================
  bool canPlaceFlowers(List<int> flowerbed, int n) {
    //앞뒤가 0이면 그자리를 1로 만들고 다음으로 넘어감
    //심어야 하는 꽃은 count--
    //앞뒤가 0인거는 if문으로 확인
    for(int i=0; i<flowerbed.length; i++){
      print('시작 flowerbed: $flowerbed');
      if((flowerbed.length == 1 && flowerbed[0] == 0) || n == 0){return true;} //배열이 1개이고 그 배열의 수가 0일때 or n의 수가 0일때 true
      
      if(i == 0){//인덱스가 0일때
        if(flowerbed[i] == 0 && flowerbed[i+1] ==0){
          flowerbed[i] = 1;
          n--;
        }
      }else if(i == flowerbed.length-1){ //인덱스가 마지막일때
        if(flowerbed[i-1] == 0 && flowerbed[i] == 0){
          flowerbed[i] = 1;
          n--;
        }
      }else{ //그 외일때
        if(flowerbed[i-1] == 0 && flowerbed[i] == 0 && flowerbed[i+1] ==0){ 
          flowerbed[i] = 1;
          n--;
        }
      }
      
      if(n == 0){return true;}
      print('i: $i');
      print('n: $n');
      print('끝 flowerbed: $flowerbed');
    }

    return false;
  }

  //정답================================================================
  bool canPlaceFlowers2(List<int> flowerbed, int n) {
  int count = 0;
  int length = flowerbed.length;
  
  // 현재 i가 비어있으면서 && 첫번째 or 왼쪽이 비어있으면서 && 마지막 or 오른쪽이 비어있다면?

  for (int i = 0; i < length; i++) {
    if (flowerbed[i] == 0 &&
        (i == 0 || flowerbed[i - 1] == 0) &&
        (i == length - 1 || flowerbed[i + 1] == 0)) {
      flowerbed[i] = 1; // 꽃을 심음
      count++;
      if (count >= n) {
        return true; // 충분히 많은 꽃을 심었으면 true 반환
      }
    }
  }

  return count >= n;
}
}