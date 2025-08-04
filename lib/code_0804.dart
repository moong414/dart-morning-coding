void main() {
  Solution solution = Solution();
  print(solution.summaryRanges2([0, 1, 2, 4, 5, 7]));
}

//228. 요약 범위
class Solution {
  //내답안(오답)
  List<String> summaryRanges(List<int> nums) {
    int firstNum = 0;
    int countNum = 0;
    List<String> result = [];

    for (int i = 0; i < nums.length; i++) {
      if (nums[0] == nums[i]) {
        firstNum = nums[i]; //처음들어온 숫자 저장
        continue;
      }
      if (nums[i] == nums.length - 1) {
        //마지막 숫자일 경우
        countNum = nums[i];
        if (firstNum != countNum) {
          result.add('$firstNum -> $countNum');
        } else {
          result.add('$countNum');
        }
        return result;
      }
      if (firstNum + 1 == nums[i]) {
        //첫번째 숫자에서 +1한게 새로운 숫자와 일치하면
        countNum + 1; //count가 1씩 늘어남
      } else {
        //일치하지 않으면
        result.add('$firstNum -> $countNum'); //리스트의 요소로 들어가고
        firstNum = nums[i]; //첫번째 숫자가 새로 들어온 숫자로 바뀜
      }
    }
    return result;
  }

  //오답↑↑↑↑↑↑↑↑↑↑↑↑↑
  //튜터님 답안===========================================
  List<String> summaryRanges2(List<int> nums) {
    if (nums.isEmpty) return [];
    List<String> result = [];
    int start = nums[0];

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] != nums[i - 1] + 1) {
        if (nums[i] != nums[i - 1]) {
          result.add('$start');
        } else {
          result.add('$start -> ${nums[i - 1]}');
        }
        start = nums[i];
      }
    }

    if (start == nums.last) {
      result.add('$start');
    } else {
      result.add('$start -> ${nums.last}');
    }

    return result;
  }

  //정답===========================================
  List<String> summaryRanges3(List<int> nums) {
    // 결과를 저장할 리스트
    List<String> result = [];
    int n = nums.length;

    // 배열이 비어있으면 빈 리스트 반환
    if (n == 0) return result; // 가드 패턴

    // 범위 시작점
    int start = nums[0];

    for (int i = 0; i < n; i++) {
      // 마지막 원소이거나 현재 숫자와 다음 숫자가 연속되지 않는 경우
      if (i == n - 1 || nums[i] + 1 != nums[i + 1]) {
        // 범위가 한 숫자인 경우
        if (start == nums[i]) {
          result.add(start.toString());
        } else {
          // 범위가 여러 숫자인 경우
          result.add("$start->${nums[i]}");
        }
        // 다음 범위의 시작점을 업데이트
        if (i != n - 1) {
          start = nums[i + 1];
        }
      }
    }

    return result;
  }
}
