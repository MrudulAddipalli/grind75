
// Time -  O(n * 4^n)
// Space - O(4^n)

// Solution - https://www.youtube.com/watch?v=0snEunUacZY

// Runtime: 319 ms, faster than 90.24% of Dart online submissions for Letter Combinations of a Phone Number.
// Memory Usage: 157.4 MB, less than 7.32% of Dart online submissions for Letter Combinations of a Phone Number.

class Solution {
  List<String> letterCombinations(String digits) {
    // base case
    if (digits.isEmpty) return [];

    Map<String, String> keys = {
      "2": "abc",
      "3": "def",
      "4": "ghi",
      "5": "jkl",
      "6": "mno",
      "7": "pqrs",
      "8": "tuv",
      "9": "wxyz",
    };
    List<String> res = [];

    backtrack(int i, String currString) {
      print("current i - $i, currString - $currString");

      if (currString.length == digits.length) {
        res.add(currString);
        return;
      }

      // create combinations from stringsForCombination
      String stringsForCombination = keys[digits[i]]!;
      print("stringsForCombination - $stringsForCombination");
      for (int char = 0; char < stringsForCombination.length; char++) {
        backtrack(i + 1, currString + stringsForCombination[char]);
      }
    }

    backtrack(0, "");

    return res;
  }
}

void main() {
  print("Result - ${Solution().letterCombinations("23")}");
}
// current i - 0, currString - 
// stringsForCombination - abc
// current i - 1, currString - a
// stringsForCombination - def
// current i - 2, currString - ad
// current i - 2, currString - ae
// current i - 2, currString - af
// current i - 1, currString - b
// stringsForCombination - def
// current i - 2, currString - bd
// current i - 2, currString - be
// current i - 2, currString - bf
// current i - 1, currString - c
// stringsForCombination - def
// current i - 2, currString - cd
// current i - 2, currString - ce
// current i - 2, currString - cf
// Result - [ad, ae, af, bd, be, bf, cd, ce, cf]