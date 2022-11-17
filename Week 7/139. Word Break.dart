// Solution - https://www.youtube.com/watch?v=Sx9NNgInc3A

class Solution {
  bool wordBreak(String s, List<String> wordDict) {
    //
    //
    return true;
  }
}

void main() {
  print('Result - ${Solution().wordBreak(
    "catsandog",
    ["cats", "dog", "sand", "and", "cat"],
  )}');
}

// Solution2 Not working for

// "bb"
// ["a","b","bbb","bbbb"]
// out - false
// exp - true

class Solution2 {
  bool wordBreak(String s, List<String> wordDict) {
    for (int i = 0; i < wordDict.length; i++) {
      String dicWord = wordDict[i];
      bool conts = s.contains(dicWord);
      print("[$dicWord] contains in S - $conts");
      if (conts) {
        s = s.replaceAll(dicWord, "");
        print("S After replace $s");
      } else {
        return false;
      }
    }

    return true;
  }
}
