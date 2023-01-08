// Naive Approch
// Store All Unique Characters From string
// let say we have A,B,c
// replace K number of A with B from string, find longest consecutive
// replace K number of B with C from string, find longest consecutive
// replace K number of C with A from string, find longest consecutive
// how to find longest consecutive, use Map and get max value from each key
// now challange is which character should we remove in K loop, we have try each position

// Solution - https://www.youtube.com/watch?v=gqXU1UyA8pk&t=197s
// Time - O(26.N)

// For More Optimised Solution - https://www.youtube.com/watch?v=gqXU1UyA8pk&t=1145s

class Solution {
  int characterReplacement(String s, int k) {
    Map<String, int> count = {};
    int res = 0;
    int l = 0;
    for (int r = 0; r < s.length; r++) {
      count[s[r]] = 1 + (count[s[r]] ?? 0);

      // window has string where characters that needs to be replaced is more than given K,
      // hence reducing L by 1 to get correct String Window
      // maxOfMapValues will give max repeated character in the string window r-l+1
      while ((r - l + 1) - maxOfMapValues(count.values) > k) {
        count[s[l]] = (count[s[l]] ?? 0) - 1;
        l++;
      }

      // not using currentWindowStringLen, here because we are updating l in while loop
      res = max(res, r - l + 1);
    }
    return res;
  }

  int max(int a, int b) => a > b ? a : b;

  int maxOfMapValues(Iterable<int> values) {
    int max = -1;
    for (int x in values) {
      if (x >= max) max = x;
    }
    return max;
  }
}
