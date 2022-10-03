// Runtime: 1052 ms, faster than 26.84% of Dart online submissions for Roman to Integer.
// Memory Usage: 148.9 MB, less than 81.11% of Dart online submissions for Roman to Integer.

// https://www.youtube.com/watch?v=3jdxYj3DD98

class Solution {
  Map<String, int> map = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
  };

  int getInt(String c) {
    return map[c] ?? 0;
  }

  int romanToInt(String s) {
    int sum = 0;
    for (int i = 0; i < s.length; i++) {
      if (i + 1 < s.length && getInt(s[i]) < getInt(s[i + 1])) {
        // once left part is removed we add total value on next iteration in line 28
        sum -= getInt(s[i]);
      } else {
        sum += getInt(s[i]);
      }
    }
    return sum;
  }
}
