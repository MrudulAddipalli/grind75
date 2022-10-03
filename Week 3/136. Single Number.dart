class Solution {
  int singleNumber(List<int> nums) {
    nums.sort();
    List<int> s = [];
    // constraints - 1 <= nums.length <= 3 * 104
    // nums,lenght will always be > 0
    for (int i = 0; i < nums.length; i++) {
      if (s.contains(nums[i])) {
        // Each element in the array appears """twice""" except for one element which appears only once
        s.remove(nums[i]);
      } else {
        s.add(nums[i]);
      }
    }
    // except for one element which appears only once
    // in the end only that number will stay in s array which is repeated once
    return s.first;
  }
}
