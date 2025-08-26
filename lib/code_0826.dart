void main() {
  Solution solution = Solution();
  print(
    'result: ${solution.countBits(2)}=======================================',
  );
}

// 338. 비트 개수 구하기
class Solution {
  //내답안====================================================================
  List<int> countBits(int n) {
    //0부터 n까지의 2진수를 구해서 그 2진수에서 1의 갯수만 세서 리스트를 만들어야함
    //2가 들어올경우, 0, 1, 2의 2진수는 각각 00, 01, 10이므로 1의 갯수는 0, 1, 1
    //리스틑 [0, 1, 1]이 됨

    List<int> nList = [];
    List<int> bitCount = [];
    int count = 0;

    for (int i = 0; i < n + 1; i++) {
      //숫자n에 이르기까지의 숫자를 count로 세서 nList에 넣음
      nList.add(count);
      if (count <= n) {
        count++;
      }
    }

    print('nList: $nList'); //2가 들어올경우 [0, 1, 2]

    for (int j = 0; j < nList.length; j++) {
      //nList의 갯수만큼 for문 돌림

      var thisbit = nList[j]
          .toRadixString(2)
          .split(''); //nList의 각 숫자를 toRadixString으로 2진수로 만든다음 배열로 만듦
      print('thisbit: $thisbit');
      count = 0;

      for (int k = 0; k < thisbit.length; k++) {
        //thisbit에 있는 숫자들을 하나씩 보면서 1일경우 count를 늘림
        if (thisbit[k] == '1') {
          count++;
        }
        print('count: $count');
      }

      bitCount.add(
        count,
      ); //해당하는 1의 갯수(count)를 bitCount에 넣음/ 2일경우 [00, 01, 10] 이므로 [0, 1, 1]
    }

    return bitCount;
  }

  //정답====================================================================
  List<int> countBits2(int n) {
    List<int> dp = List.filled(n + 1, 0);

    // dp = [ 0, 1, 1, 2 ]

    for (int i = 1; i <= n; i++) {
      // i = 1, i >> 1 == 01 >> 1 == 00 + (i & 1 == 1 & 1 == 1)
      // i = 2, 2 >> 1 == 10 >> 1 == 01 + (i & 1 == 10 & 01 == 00)
      // i = 3, 3 >> 1 == 11 >> 1 == 01 + (i & 1 == 11 & 01 == 01)

      dp[i] = dp[i >> 1] + (i & 1);
    }

    return dp;
  }
}
