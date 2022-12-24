// Solution - https://www.youtube.com/watch?v=cjWnW0hdF1Y

// Brute Force Approach - use 2 for loops, and create array with nums[i] till nums[j] onyl add to local when { nums[i] < nums[j] }
// once inner loop is complete calculate len of array and store in max variable
// at last return max
// Time - O(n^2)

// Dynamic Approach
// Time - O(n^2)

class Solution {
  int lengthOfLIS(List<int> nums) {
    List<int> LIS = List.filled(nums.length, 1);

    for (int i = nums.length - 1; i >= 0; i--) {
      for (int j = i + 1; j < nums.length; j++) {
        if (nums[i] < nums[j]) {
          LIS[i] = max(LIS[i], 1 + LIS[j]);
        }
      }
    }

    return maxOfList(LIS);
  }

  int max(int a, int b) => a > b ? a : b;

  int maxOfList(List<int> arr) {
    int maxValue = arr.first;
    for (int i = 1; i < arr.length; i++) {
      if (maxValue < arr[i]) maxValue = arr[i];
    }
    return maxValue;
  }
}
