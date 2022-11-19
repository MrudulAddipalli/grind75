// Solution - https://www.youtube.com/watch?v=Sx9NNgInc3A

// same as python code but giving time limit exceeded for dart

// Runtime: 58 ms, faster than 76.92% of Python3 online submissions for Word Break.
// Memory Usage: 14 MB, less than 43.68% of Python3 online submissions for Word Break.

// class Solution:
//     def wordBreak(self, s: str, wordDict: List[str]) -> bool:
//         dp = [False] * (len(s) + 1)
//         dp[len(s)] = True

//         for i in range(len(s)-1,-1,-1):
//             for w in wordDict:
//                 if(i+len(w)) <= len(s) and s[i:i+len(w)] == w:
//                     dp[i] = dp[i+len(w)]
//                 if dp[i]:
//                     break
        
//         return dp[0]

// Approach - Dynamic Programming, Back Tracking, Caching, Bottom Up Approach 
class Solution {
  bool wordBreak(String s, List<String> wordDict) {
    List<bool> dp = List.filled(s.length + 1, false);

    // when we reach end means we can break the strign hence marking end char as true
    dp[s.length] = true;

    for (int i = s.length - 1; i >= 0; i--) {
      for (final word in wordDict) {
        if (
            // to avoid out of bound
            (i + word.length <= s.length) &&
                // if substring matches with the word in wordDict
                (s.substring(i, i + word.length) == word)) {
          print("dp[${i}] = dp[${i + word.length}]");
          print("char at ${i} - ${s[i]}");
          dp[i] = dp[i + word.length];
        }
        if (dp[i] == true) { print("Breaking inner for loop since dp[${i}] is true"); break;}
      }
    }
    return dp[0];
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
