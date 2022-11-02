
// Runtime: 595 ms, faster than 54.55% of Dart online submissions for Coin Change.
// Memory Usage: 150.4 MB, less than 54.55% of Dart online submissions for Coin Change.

// Time Complexity - O(amount * coins.lenght)
// Space Complexity - O(amount) - for dp array

// Solution - https://www.youtube.com/watch?v=H9bfqozjoqs

// Bottom Up , Memoization, Dynamic Programming
class Solution {
  int coinChange(List<int> coins, int amount) {
    List<int> dp = [];
    for(int i=0; i<= amount+1; i++) dp.add(amount + 1);
    dp[0] = 0;
    
    for(int a=1; a< amount+1; a++){
      for(int j=0; j< coins.length; j++){
        int c = coins[j];
        if(a-c >= 0){
          dp[a] = min(dp[a], 1 + dp[a-c]);
        }
      }
    }
    if(dp[amount] == amount + 1){
      return -1;
    }
    return dp[amount];
  }

  int min(int a, int b){
    return a > b ? b : a;
  }
}


// not working for coinChange([186,419,83,408],6249)
class Solution2 {
  int coinChange(List<int> coins, int amount) {
    int res = 0;
    // since coins is sorted or not is not mentioned,
    // hence without sort our case for coinChange([2,5,10,1],27) was failing
    // hence using sort
    coins.sort();
    while(coins.isNotEmpty){
      int count = amount ~/ (coins.last);
      res += count;
      amount = amount - (coins.last * count);
      coins.removeLast();
    }
    // if amount is not 0 means we have not found exact coins which can sum up to amount
    print("Final Amount - $amount");
    return amount == 0 ? res : -1;
  }
}

void main() {
//   print("Result - ${Solution().coinChange([1,2,5],11)}");
//   print("Result - ${Solution().coinChange([2],3)}");
//   print("Result - ${Solution().coinChange([2,5,10,1],27)}");
  
  print("Result - ${Solution().coinChange([186,419,83,408],6249)}");
}