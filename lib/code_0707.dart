void main() {
  List<int> nums = [2, 2, 1];
  print(singleNumber3(nums));
}

//136번 단일숫자찾기
//정답========================================

//map을 이용하기
int singleNumber(List<int> nums) {
  //[2, 2, 1];
  if(nums.length == 1){
    return nums[0];
  }

  Map<int, int> map = {};

  for(var num in nums){
    if(map.containsKey(num)){
      map[num] = map[map]! + 1;
    }else{
      map[num] = 1;
    }
  }

  //{2:2, 1:1}
  for(var key in map.keys){
    if(map[key] == 1){
      return key;
    }
  }

  return 0;
}

//map을 이용하기2
int singleNumber2(List<int> nums) {
  if(nums.length == 1){
    return nums[0];
  }
  //2, 2, 1
  Map<int, int> map = {};
  for(var num in nums){
    if(map.containsKey(num)){
      map.remove(num);
    }else{
      map[num] = 1;
    }
  }

  return 0;
}




//비트연산으로 찾기
int singleNumber3(List<int> nums) {
  int result = 0;
  for (int num in nums) {
    result ^= num; 
  }
  
  return result;
}
