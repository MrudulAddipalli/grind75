// Solution - https://www.youtube.com/watch?v=wiGpQwVHdE0

// Runtime: 578 ms, faster than 91.18% of Dart online submissions for Longest Substring Without Repeating Characters.
// Memory Usage: 143.8 MB, less than 94.54% of Dart online submissions for Longest Substring Without Repeating Characters.

// Time Complexity - O(n), set contains is O(1)
// Space Complexity - O(n), set for storing characters from string of lenght N 
class Solution {
  int lengthOfLongestSubstring(String s) {
    // sliding window algorithm
    int res = 0;
    Set charSet = {};
    int leftPointer = 0;
    for (int rightPointer = 0; rightPointer < s.length; rightPointer++) {
      while (charSet.contains(s[rightPointer])) {
        charSet.remove(s[leftPointer]);
        leftPointer++;
      }
      charSet.add(s[rightPointer]);
      res = max(res, rightPointer - leftPointer + 1);
    }
    return res;
  }

  int max(int a, int b) {
    return a < b ? b : a;
  }
}

void main() {
//   print("Final Array - ${Solution().lengthOfLongestSubstring("abcabcbb")}");
//   print("Final Array - ${Solution().lengthOfLongestSubstring("bbbbb")}");
  print("Final Array - ${Solution().lengthOfLongestSubstring("pwwkew")}");
}
