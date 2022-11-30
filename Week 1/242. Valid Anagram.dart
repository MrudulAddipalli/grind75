// Runtime: 622 ms, faster than 9.68% of Dart online submissions for Valid Anagram.
// Memory Usage: 141.3 MB, less than 97.85% of Dart online submissions for Valid Anagram.

// Solution - https://www.youtube.com/watch?v=9UtInBqnCgA

// Time - O(n)
// Space - O(n) - single map


// For Constant Space Complexity O(1)
// Sort both array and check if they are equal
// but here Time Complexity becomes - O(n logn) 

class Solution {
  bool isAnagram(String s, String t) {
    int sLen = s.length, lLen = t.length, i;

    // Base Case
    if (sLen != lLen) return false;

    Map<String, int> char = {};
    for (i = 0; i < sLen; i++) {
      if (char[s[i]] == null) {
        char[s[i]] = 1;
      } else {
        char[s[i]] = char[s[i]]! + 1;
      }
    }
    for (i = 0; i < lLen; i++) {
      if (char[t[i]] == null) {
        // char of t is not present in s, hence not an anagram, return false;
        return false;
      } else {
        char[t[i]] = char[t[i]]! - 1;
      }
    }
    for (i = 0; i < sLen; i++) {
      // if any char as count > 0 means it's not an anagram as we decrement count in 2nd loop
      if (char[s[i]]! > 0) {
        return false;
      }
    }
    // if not anagram code will be returned in 3rd loop
    return true;
  }
}

void main() {
  print(Solution().isAnagram("anagram", "nagaram"));
}
