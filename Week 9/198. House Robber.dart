

// not working for [2,1,1,2], since we are getting 4 from 1st and 4th index, and our logic only works for 0-2-4 or 1-3-5 combinations
class Solution {
  int rob(List<int> nums) {
    int biggestRobbedAmount = 0;
    int currentAmount = 0;
    robFrom({required int startIndex}) {
      for (int i = startIndex; i < nums.length; i = i + 2) {
        print("${nums[i]} @ index $i");
        currentAmount += nums[i];
        biggestRobbedAmount = max(biggestRobbedAmount ,currentAmount);
      }
    }
    // From Even Places
    robFrom(startIndex: 0);
    // reset
    currentAmount = 0;
    // From Odd Places
    robFrom(startIndex: 1);
    
    return biggestRobbedAmount;
  }
  int max(int a, int b) => a > b ? a : b;
}

void main() {
  // print("Result - ${Solution().rob([2, 7, 9, 3, 1])}");
  print("Result - ${Solution().rob([1, 1])}");
}
