// Solution  - https://www.youtube.com/watch?v=KLlXCFG5TnA

// Time - O(n)
// Space - O(n) - for map
class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> map = {}; // value : index
    for (int i = 0; i < nums.length; i++) {
      int diff = target - nums[i];
      if (map.containsKey(diff)) return [map[diff]!, i];
      map[nums[i]] = i;
    }
    return [];
  }
}

class Solution2 {
  List<int> twoSum(List<int> nums, int target) {
    for (int i = 0; i < nums.length; i++) {
      int k = (i + 1 == nums.length) ? nums.length : i + 1;
      for (int j = k; j < nums.length; j++) {
        if (nums[i] + nums[j] == target) {
          return [i, j];
        }
      }
    }
    return [];
  }
}
