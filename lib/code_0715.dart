import 'dart:math';

void main() {
  List<int> prices = [7, 1, 5, 3, 6, 4];
  Solution solution = Solution();
  print(solution.maxProfit(prices));
}

//121. 주식 매수 및 매도의 최적 시기

class Solution {
  //↓↓↓↓개노답오답
  int maxProfit(List<int> prices) {
    int? prev;
    int min = 1;
    int max = 1;
    List<int> newPrices = [];
    bool skip = true;

    for (int li in prices) {
      if (skip) {
        if (prev != null && li < prev) {
          skip = false;
          newPrices.add(li);
        }
      } else {
        newPrices.add(li);
      }
      prev = li;
    }

    if (newPrices.isEmpty) {
      return 0;
    }

    for (int li in newPrices) {
      if (li <= min) {
        min = li;
      }
      if (li > max) {
        max = li;
      }
    }
    int result = max - min;
    return result;
  }
  //↑↑↑↑오답

  //정답========================================================================
  int maxProfit2(List<int> prices) {
    if (prices.isEmpty) return 0;

    int minPrice = prices[0];
    int maxProfit = 0;

    for (int i = 1; i < prices.length; i++) {
      int currentProfit = prices[i] - minPrice;

      if (currentProfit > maxProfit) {
        maxProfit = currentProfit;
      }

      if (prices[i] < minPrice) {
        minPrice = prices[i];
      }
    }

    return maxProfit;
  }

  //정답========================================================================
  int maxProfit3(List<int> prices) {
    int minPrice = double.maxFinite.toInt(); // 최대값으로 초기화
    int maxProfit = 0; // 최대 이익 초기화

    for (int price in prices) {
      if (price < minPrice) {
        minPrice = price; // 최소 가격 업데이트
      } else {
        maxProfit = max(maxProfit, price - minPrice); // 최대 이익 계산
      }
    }

    return maxProfit;
  }
}
