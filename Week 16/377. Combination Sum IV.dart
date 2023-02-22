// Solution Explaination - https://www.youtube.com/watch?v=dw2nMCxG0ik
// Solution - https://www.youtube.com/watch?v=5OjzyK8tnJU

// Time - O(nxm) - 100%
// Space - O(n) - 100%
// n - target, m - length of nums

class Solution1 {
  int combinationSum4(List<int> nums, int target) {
    Map<int, int> cache = {};
    int helper(int remaining) {
      if (remaining == 0) return 1;
      if (remaining < 0) return 0;
      if (cache.containsKey(remaining)) return cache[remaining]!;
      int count = 0;
      for (int num in nums) {
        count += helper(remaining - num);
      }
      // updating cache
      cache[remaining] = count;
      return count;
    }

    return helper(target);
  }
}

class SolutionDynamicProgramming {
  int combinationSum4(List<int> nums, int target) {
    // since we need to return dp[target], we need to have array length more than target to get last index
    List<int> dp = [];
    for (int i = 0; i <= target; i++) dp[i] = 0;
    // base case
    dp[0] = 1;
    for (int remaining = 0; remaining <= target; remaining++)
      for (int num in nums)
        if ((remaining - num) >= 0) dp[remaining] += dp[remaining - num];
    return dp[target];
  }
}
