// Naive - Brute Force Approach takes O(n^2) time and find all possible subarrays


// Solution - https://www.youtube.com/watch?v=MHocw0bP1rA
// Time - O(n) - 60%
// Space - O(n) - 60%

class Solution {
  int subarraySum(List<int> nums, int k) {
    int sum = 0, result = 0;
    Map<int,int> preSum = {};
    preSum[0] = 1;

    for(int i=0; i< nums.length; i++){
      sum += nums[i];
      if(preSum.containsKey(sum-k)){
        result += preSum[sum-k]!;
      }
      preSum[sum] = (preSum[sum] ?? 0) + 1;
    }
    return result;
  }
}