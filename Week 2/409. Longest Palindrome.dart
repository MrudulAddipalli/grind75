// https://www.youtube.com/watch?v=a_3XDW9P47E

// Dart Not Working
class Solution {
  int longestPalindrome(String s) {

    Map<String, int> count = {};
    for (int i = 0; i < s.length; i++) {
      count[s[i]] = (count[s[i]] ?? 0) + 1;
    }

    int c = 0;

    count.keys.forEach((k) {
      print("key - $k");
      c += (count[k]! ~/ 2) * 2;
      // checking if ans is even pattern - for even we don;t have issue, 
      // issue comes when we have odd char count
      // hence including a character which has odd repeatation
      // once odd is counted we increment ans, and in future condition check our ans will always be odd for ans % 2 != 0 
      // lets say we have z of count 1 at last element of array
      // then we can only add the odd repeat char if our ans is even i.e our string is palindrome
      // else we will not add 
      if (c % 2 == 0 && count[k]! % 2 == 1) {
        c++;
      }
    });

    return c;
  }
}

// Same in Java working

// ccccbbbcccc
// [8,3]
// 8/2 - 4 , 4 * 2 = 8, c = 8
// 8 % 2 = 0 && 8 % 2 != 1, -- false 
// 3/2 - 1, 1 * 2 = 2, c = 8 + 2 = 10,
// 10 % 2 = 0 && 3 % 2 != 1, -- true, c++ - c = 11 
// final c = 11


// class Solution2 {
//     public int longestPalindrome(String s) {
//         int[] count = new int[128];
//         for (char c: s.toCharArray())
//             count[c]++;

//         int ans = 0;
//         for (int v: count) {
//             ans += v / 2 * 2;
//             checking if ans is even pattern - for even we don;t have issue, 
//             issue comes when we have odd char count
//             hence including a character which has odd repeatation
//             once odd is counted we increment ans, and in future condition check our ans will always be odd for ans % 2 != 0 
//             lets say we have z of count 1 at last element of array
//             then we can only add the odd repeat char if our ans is even i.e our string is palindrome
//             else we will not add 
//             if (ans % 2 == 0 && v % 2 == 1)
//                 ans++;
//         }
//         return ans;
//     }
// }
