// Solution - https://www.youtube.com/watch?v=U8XENwh8Oy8

// Time - O(log n) - Binary Search

class Solution {
  int search(List<int> nums, int target) {
    int l = 0, r = nums.length - 1, mid = 0;
    // Binary Search
    while (l <= r) {
      mid = (l + r) ~/ 2;

      if (target == nums[mid]) return mid;

      if (nums[l] <= nums[mid]) {
        if (target > nums[mid] || target < nums[l])
          l = mid + 1;
        else
          r = mid - 1;
      } else {
        if (target < nums[mid] || target > nums[r])
          r = mid - 1;
        else
          l = mid + 1;
      }
    }
    return -1;
  }
}
