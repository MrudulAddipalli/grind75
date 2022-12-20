
// Solution - https://www.youtube.com/watch?v=5WZl3MMT0Eg

// Runtime: 688 ms, faster than 44.83% of Dart online submissions for Maximum Subarray.
// Memory Usage: 181 MB, less than 60.35% of Dart online submissions for Maximum Subarray.

// Time Complexity - O(n)
// Space Complexity - O(n)

// Kadane's Algorithm
class Solution {
  int maxSubArray(List<int> nums) {
    int sum = 0, max = nums.first;
    print("Initial sum - $sum  and max - $max");
    for(int i=0; i<nums.length; i++){
      if(sum < 0 ){ sum = 0; }
      sum += nums[i];
      if(max <= sum) max = sum;
      print("Current sum - $sum  and max - $max");
    }
    return max;
  }
}