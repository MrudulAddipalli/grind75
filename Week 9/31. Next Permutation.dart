
// Solution - https://www.youtube.com/watch?v=LuLCLgMElus

// Solution - https://leetcode.com/problems/next-permutation/solutions/13871/simple-java-solution/

// Time - O(n)
// Space - O(1)

class Solution {
  void nextPermutation(List<int> nums) {
    // ALGO
    // find index (i) from reversse such that nums[i] < nums[i+1] --- index 1
    // find index (i+1) from reversse such that nums[i] > nums[i+1] --- index 2
    // swap values of index1 & index2
    // reverse elements from index1 + 1 till end
    if (nums.length <= 2) {
      // if array is of length 1 then in swap method j is 1, where we have length check addec
      swap(nums, 0, 1);
    } else {
      int i = nums.length - 2;
      while (i >= 0 && nums[i] >= nums[i + 1]) {
        i--;
      }
      if (i >= 0) {
        int j = nums.length - 1;
        while (j > i && nums[i] >= nums[j]) {
          j--;
        }
        swap(nums, i, j);
      }
      reverse(nums, i + 1, nums.length - 1);
    }
  }

  swap(List<int> nums, int i, int j) {
    if (j < nums.length) {
      int temp = nums[i];
      nums[i] = nums[j];
      nums[j] = temp;
    }
  }

  reverse(List<int> nums, int i, int j) {
    while (i < j) swap(nums, i++, j--);
  }
}

void main() {
  Solution().nextPermutation([1, 3, 5, 4, 2]);
//     print("Result - ${Solution().nextPermutation([1,3,5,4,2])}");
}
