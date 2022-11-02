// Solution - https://www.youtube.com/watch?v=bNvIQI2wAjk
// or
// Solution - https://www.youtube.com/watch?v=khTiTSZ5QZY

// Runtime: 378 ms, faster than 92.86% of Dart online submissions for Product of Array Except Self.
// Memory Usage: 173.3 MB, less than 9.52% of Dart online submissions for Product of Array Except Self.

class Solution {
  List<int> productExceptSelf(List<int> nums) {
    int len = nums.length;

    List<int> res = [];
    res.add(1);

    for (int i = 1; i < len; i++) {
      res.add(nums[i - 1] * res[i - 1]);
      // this will added in "res" at index i
      // Oth element is already added by default 1, so from index 1 to len - 1, we added new value
    }
    print(nums);
    print(res);

    int R = 1;
    for (int i = len - 1; i >= 0; i--) {
      print("R - $R");
      res[i] = res[i] * R;
      R = R * nums[i];
    }

    return res;
  }
}

// Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
// You must write an algorithm that runs in O(n) time and without using the division operation.

class Solution2 {
  List<int> productExceptSelf(List<int> nums) {
    int productOfAll = 1;
    for (int i = 0; i < nums.length; i++) {
      productOfAll = productOfAll * nums[i];
    }

    for (int i = 0; i < nums.length; i++) {
      nums[i] = productOfAll ~/ nums[i];
    }

    return nums;
  }
}

void main() {
  print("Result - ${Solution().productExceptSelf([1, 2, 3, 4])}");
}
