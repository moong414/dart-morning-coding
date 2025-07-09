void main() {
  List<int> nums = [3, 2, 3];
  List<int> nums2 = [2, 2, 1, 1, 1, 2, 2];

  Solution solu = Solution();

  print(solu.majorityElement(nums));
  print(solu.majorityElement(nums2));
}

//169. 다수원소
//배열에서 최빈값 찾기
class Solution {
  int majorityElement(List<int> nums) {
    int mostnum = 0;
    int count = 0;

    for (var i = 0; i < nums.length; i++) {
      if (mostnum == nums[i]) {
        count++;
      } else {
        count--;
      }
      if (count <= 0) {
        mostnum = nums[i];
      }
    }

    return mostnum;
  }
  //↑↑↑↑↑ 오답

  //정답=============================================================================================
  int majorityElement2(List<int> nums) {
    if(nums.length == 1) return nums[0];
    int answer = 0;
    int answerCount = 0;
    Map<int, int> countMap = {};
    for(int i = 0; i < nums.length; i++){
      if(countMap.containsKey(nums[i])){
        countMap[nums[i]] = countMap[nums[i]]! + 1;
      }else{
        countMap[nums[i]] = 1;
      }
      if(countMap[nums[i]]! > answerCount){
        answer = nums[i];
        answerCount = countMap[nums[i]]!;
      }
      if(answerCount > nums.length / 2){
        break;
      }
    }
    return answer;
  }

  //정답2=============================================================================================
  int majorityElement3(List<int> nums) {
        int candidate = nums[0];
        int count = 1;

        // 1차 투표
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] == candidate) {
                count++; // 후보가 같으면 카운트 증가
            } else {
                count--; // 후보가 다르면 카운트 감소
                if (count == 0) {
                    candidate = nums[i]; // 카운트가 0이 되면 새로운 후보로 변경
                    count = 1; // 카운트 초기화
                }
            }
        }

        return candidate; // 최빈값 반환
    }
    //↑↑↑ 이 방법은 특정숫자가 절반이상일경우만 가능하고, '가장 많은 수' 는 찾을수없다. (4대 3대 2일 경우, 4는 절반이상이 아니므로 X)


  //정답3=============================================================================================
  int majorityElement4(List<int> nums) {
    nums.sort();
    return nums[nums.length ~/ 2];
  }
  //↑↑↑ 중간요소가 가장 많은 수
}



