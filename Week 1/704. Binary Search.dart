class Solution {
  int search(List<int> nums, int target) {
    int len = nums.length;
    if (len <= 0) return -1;
    int max = len, min = 0, mid = 0, count = 0;
    while (count < ((len / 2) + 1)) {
      mid = (max + min) ~/ 2;
      print("max - $max min - $min mid - $mid");
      print("max - min --- ${max - min} ${(max - min != 0)}");
      if (nums[mid] == target) return mid;
      if (target < nums[mid]) {
        max = mid;
      } else {
        min = mid;
      }
      print("After sort --- max - $max min - $min mid - $mid");
      count++;
    }
    if (nums[mid] == target) return mid;
    return -1;
  }
}


class Solution2 {
  int search(List<int> nums, int target) {
    int len = nums.length;
    if (len <= 0) return -1;
    int max = len, min = 0, mid = 0;
    while (min<max) { // change
      mid = (min + (max - min)) ~/ 2;
      if (nums[mid] == target) return mid;
      if (target < nums[mid]) {
        max = mid;
      } else {
        min = mid + 1; // change
      }
    }
    if (min == max) return min; // change - handling edge case
    return -1;
  }
}
