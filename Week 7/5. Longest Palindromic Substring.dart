// Solution - https://www.youtube.com/watch?v=XYQecbcd6_c

class Solution {
  String longestPalindrome(String s) {
    String res = "";
    int resLen = 0;
    whileLoop(int left, int right) {
      while (left >= 0 && right < s.length && s[left] == s[right]) {
        if ((right - left - 1) > resLen) {
          res = s.substring(left, right + 1);
          resLen = right - left - 1;
        }
      }
    }

    for (int i = 0; i < s.length; i++) {
      // Odd Length
      int left = i, right = i;
      whileLoop(left, right);

      // Even Length
      left = i;
      right = i + 1;
      whileLoop(left, right);
    }
    return res;
  }
}

// Time - O(n * n^2) - O(n^3)
// Spacr - O(n^2)

// Time Limit Exceeded for Dart And Java

class Solution2 {
  Map<String, bool> palindromeStatus = {};

  String longestPalindrome(String s) {
    String pal = "";
    for (int i = 0; i < s.length; i++) {
      for (int j = i; j < s.length; j++) {
        // end is not considered in subString
        String subStrings = s.substring(i, j + 1);

        // optimisation
        // no need process isPalindrome fro shorter number than already
        // existing palindrome number
        if (pal.length > subStrings.length) continue;

        bool isPal = isPalindrome(subStrings);
        palindromeStatus[subStrings] = isPal;
        if (isPal) {
          print("isPal - $isPal");
          if (pal.length < subStrings.length) pal = subStrings;
          print("current pal - $pal");
        }
      }
    }
    return pal;
  }

  bool isPalindrome(String str) {
    print("checking for - $str");

    if (palindromeStatus.containsKey(str)) {
      print("Returning from cache");
      return palindromeStatus[str]!;
    }
    int len = str.length;

    for (int i = 0; i <= len / 2; i++) {
      if (str[i] != str[len - 1 - i]) return false;
    }

    return true;
  }
}

void main() {
  print('Result - ${Solution().longestPalindrome("babad")}');
}
