void main() {
  int n = 19;
  Solution solution = Solution();
  print(solution.isHappy(n));
}

//202. 해피 넘버
class Solution {
  //↓↓↓내 풀이
  bool isHappy(int n) {
    //숫자의 각 자리 숫자를 제곱한 값을 모두 더하기
    Set<int> seenNums = {}; //이미 본 숫자 넣는 셋

    //n 이 1이 아니면 계속해서 루프
    while (n != 1) {
      //seenNums에 n이 중복이라면 false반환
      if (seenNums.contains(n)) {
        return false;
      } else {
        //아니면 n을 '이미 본 숫자셋'에 넣기
        seenNums.add(n);
      }

      //각자리 숫자 자르기
      List nList = n.toString().split('');

      //더한값을 넣어줄 변수
      int sum = 0;

      //각자리 숫자 제곱해서 더하기
      for (String num in nList) {
        int numToInt = int.parse(num);
        sum += numToInt * numToInt;
      }

      //각자리 숫자 제곱해서 더한 숫자를 n으로 바꿔주기
      n = sum;
    }

    return n == 1 ? true : false;
  }

  //정답=========================================================
  bool isHappy1(int n) {
    Map<int, int> map = {};
    while (n != 1) {
      if (map.containsKey(n)) {
        return false;
      } else {
        map[n] = 1;
      }

      int sum = 0;
      String num = n.toString();

      for (int i = 0; i < num.length; i++) {
        sum += int.parse(num[i]) * int.parse(num[i]);
      }

      n = sum;
    }
    return true;
  }

  //정답2=================================================
  bool isHappy2(int n) {
    Set<int> seen = {};
    while (n != 1) {
      if (seen.contains(n)) {
        return false;
      }
      seen.add(n);
      int a = 0;
      while (n > 0) {
        final int d = n % 10;
        a += d * d;
        n ~/= 10;
      }
      n = a;
    }
    return true;
  }

  //정답 3
  bool isHappy3(int n) {
    // Step 1: 중복 확인을 위한 Set 생성
    Set<int> seen = {};

    // Step 2: 반복해서 숫자의 제곱 합 계산
    while (n != 1 && !seen.contains(n)) {
      seen.add(n); // 현재 숫자를 Set에 추가
      n = getSquareSum(n); // 제곱 합 계산
    }

    // Step 3: 숫자가 1이면 행복한 숫자, 아니면 false 반환
    return n == 1;
  }

  // 숫자의 각 자리 제곱 합을 계산하는 함수
  int getSquareSum(int num) {
    int sum = 0;
    while (num > 0) {
      int digit = num % 10; // 현재 자리 숫자
      sum += digit * digit; // 제곱 합산
      num ~/= 10; // 다음 자리로 이동 (정수를 반환하는 나누기 + 대입)
    }
    return sum;
  }
}
