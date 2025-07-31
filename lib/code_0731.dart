void main() {
  Solution solution = Solution();
  print(solution.maxProfit([1, 2, 3, 4, 5]));
}

// 122. 주식 매수 및 매도의 최적 시기 II
class Solution {
  //내답안(오답)===================================================
  int maxProfit(List<int> prices) {
    //배열의 딱 중간지점을 알수있어야 할거같음, 중간지점에서 그보다 낮은수가 오면 사고, 높은수가 오면 팔고
    int result = 0;
    int sell = 0;
    int buy = 0;
    int sum = prices.reduce((a, b) {
      return a + b;
    });
    var average = sum / prices.length; //평균구하기

    //사고 팔고를 할때, 판금액-산금액으로 하고 result에 누적
    for (int price in prices) {
      if (price <= average && buy == 0) {
        //금액이 평균보다 낮고, buy가 0이면
        buy = price; //들어온 금액을 buy에 넣기
      }

      if (buy != 0 && price >= average) {
        //buy가 0이 아니고, 평균보다 높으면
        sell = price;
      }

      print('buy: $buy sell: $sell');

      if (sell != 0 && buy != 0) {
        result += sell - buy;
        sell = 0;
        buy = 0;
      }
    }
    return result;
  }
  //내답안(오답)========================================================================
  
  
  //정답 ========================================================================
  int maxProfit2(List<int> prices) {
    int totalProfit = 0; // 총 이익 초기화

    for (int i = 1; i < prices.length; i++) {
      if (prices[i] > prices[i - 1]) {
        totalProfit += prices[i] - prices[i - 1]; // 이익 계산 및 총 이익에 추가
      }
    }

    return totalProfit; // 총 이익 반환
  }
}
