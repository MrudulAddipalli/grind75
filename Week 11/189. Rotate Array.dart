// Approach 4 - https://www.youtube.com/watch?v=BHr381Guz3Y


// Approach 3
// store last K elements in array
// remove last k elements from nums
// appends stored K elements

// Time - 95%
// Space - 5%
class Solution3 {
  void rotate(List<int> nums, int k) {
      k=k.remainder(nums.length);
      int r=nums.length-k;
      List<int> getRenges=nums.getRange(r,nums.length).toList();
      nums.removeRange(r,nums.length);
      nums.insertAll(0,getRenges);
  }
}

// Approach 2
// Time - O(k)
// Space - O(1)
// Working in Dartpad but not in leetcode
class Solution2 {
  void rotate(List<int> nums, int k) {
    for (int i = 0; i < k; i++) {
      int lastElement = nums.removeLast();
      nums = [lastElement,...nums];
    }
  }
}


// Approach 1
// Time - O(k * N), N - length of nums
// Space - O(1)
// Time - Time Limit Exceeded
class Solution1 {
  void rotate(List<int> nums, int k) {
    for (int i = 0; i < k; i++) {
      int lastElement = nums.last;
      for (int e = nums.length - 2; e >= 0; e--) {
        nums[e + 1] = nums[e];
      }
      nums[0] = lastElement;
    }
  }
}