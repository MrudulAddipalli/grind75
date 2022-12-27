// Approach 1 - Sort array and apply Kadanes Algo for finding sub array
// but we have constraint saying we need to do it in O(n) time, and sort will take O(nLogn) time

// Solution - https://www.youtube.com/watch?v=P6RZZMu_maU

// Time - O(n) - 100%
// Space - O(n) - 6.67%

class Solution {
  int longestConsecutive(List<int> nums) {

    // create set
    Set<int> set = {};
    for (int i = 0; i < nums.length; i++) set.add(nums[i]);

    int longest = 0;

    for (int i = 0; i < nums.length; i++) {
      int number = nums[i];
      // start of sequence
      if (!set.contains(number - 1)) {
        int len = 0;
        // start calculating longest sequence
        while (set.contains(number + len)) {
          // e.g 1,2,3,4,100,200
          // numer is 1 and len is 0, add 1 in len , current len = 1
          // then check if number[1] + len[1] , i.e exist in set, then do len++;
          // and so on till len goes to end of continous sequence
          ++len;
        }

        longest = max(longest, len);
      }
    }

    return longest;
  }

  int max(int a, int b) => a > b ? a : b;
}
