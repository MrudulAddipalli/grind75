// Solution 1 --  for [7,1,5,3,6,4] and [7,6,4,3,1]

class Solution {
  int maxProfit(List<int> prices) {
    int max = -1;
    int? min;

    if (prices.length > 0) {
      int minIndex = 0;
      min = prices.first;
      print('Found Min - $min @ index $minIndex');

      for (int i = 0; i < prices.length; i++) {
        print('Current item - ${prices[i]}');
        if (min! >= prices[i]) {
          min = prices[i];
          minIndex = i;
          print('Found Min - $min @ index $i');
        }
      }
      for (int i = minIndex + 1; i < prices.length; i++) {
        print("Finding Max from minIndex - $minIndex");
        if (prices[i] >= max) {
          // found first buy day
          max = prices[i];
          print('Found Max - $max @ index $i');
        }
      }
    }
    int result = max - (min ?? 0);
    print('Max - $max, current Min - $min, result - $result');
    return (result < 0 || max == -1) ? 0 : result;
  }
}

// Solution 2 -- for -- [2,4,1]

class Solution2 {
  int maxProfit(List<int> prices) {
    int profit = 0;
    if (prices.length > 0) {
      for (int i = 0; i < prices.length; i++) {
        for (int j = i + 1; j < prices.length; j++) {
          if (profit < prices[j] - prices[i]) {
            profit = prices[j] - prices[i];
            profit = (profit < 0) ? 0 : profit;
          }
        }
      }
    }
    return profit;
  }
}

// Approach 1 Complexity - O(n), with space complexity O(1) since we don't need any new Data Structure
// kadane algorithm
class Solution3 {
  int maxProfit(List<int> prices) {
    int len = prices.length;
    if (len < 1) return 0;

    int lowestBuy = prices[0];
    int maxProfit = 0;

    for (int i = 1; i < len; i++) {
      if (lowestBuy > prices[i]) {
        lowestBuy = prices[i];
      }
      if ((prices[i] - lowestBuy) >= maxProfit) {
        maxProfit = prices[i] - lowestBuy;
      }
    }
    return maxProfit;
  }
}
