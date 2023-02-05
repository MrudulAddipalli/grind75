// Solution - https://www.youtube.com/watch?v=nIVW4P8b1VA

// As per the given requirement we need find solution
// in O(log n) time,
// means we need to use binary search algo


// Time - O(logn)
// Space - O(1)

// Time - 91.67%
// Memory - 8.33%

class Solution {
  int findMin(List<int> nums) {
    int res = nums[0];
    int left = 0, right = nums.length - 1;
    while (left <= right) {
      if (nums[left] < nums[right]) {
        // current array from point left to right [ end ] is sorted
        res = min(res, nums[left]);
        break;
      }
      // normal binary search
      int mid = (left + right) ~/ 2;
      res = min(res, nums[mid]);
      if (nums[mid] >= nums[left]) {
        // left portion has larger numbers
        // move right
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return res;
  }

  int min(int a, int b) => a > b ? b : a;
}
