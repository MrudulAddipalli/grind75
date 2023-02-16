// My Approach - O(n^2)
// use O(n^2) and get all posible substring
// for each string find if each character of "t" exist in it
// use map of string,int to maintain count of each string of t, and then directly match maps of both strings
// if map matches then store in variable such that only shortest string in stored in it
// return shortest string

// Solution - https://www.youtube.com/watch?v=jSto0O4AJbM
// Time - O(s) - 88.89%
// Space - O(s) - 33.33%

class Solution {
  String minWindow(String s, String t) {
    // base case
    if (t.isEmpty) return "";
    if (t.length > s.length) return "";
    if (s == t) return s;

    Map<String, int> window = {}, countT = {};

    // fill occurences of each character of string - t
    for (int i = 0; i < t.length; i++) {
      countT[t[i]] = 1 + (countT[t[i]] ?? 0);
    }

    int need = uniqueCharactersOf(t);
    int have = 0;

    List<int> res = [0, 0];
    // Given Constraints - 10^5 - 100000
    int MaxValue = 100001;
    int resLen = MaxValue;

    int left = 0;
    for (int right = 0; right < s.length; right++) {
      String currChar = s[right];
      //   print("currChar - $currChar");

      // keep updating map
      window[currChar] = 1 + (window[currChar] ?? 0);
      //   print("window[currChar] - ${window[currChar]}");

      // if currChar is in t, and repeatation of currChar is same in t and substring from left to right
      // then update have
      if (countT.containsKey(currChar) &&
          window[currChar] == countT[currChar]) {
        have++;
        // print('have - $have, need - $need window[currChar] - ${window[currChar]}');
      }

      // if have and need are same then we need to update res
      while (have == need) {
        // update our result
        int currSubStrLen = (right - left + 1);
        if (currSubStrLen < resLen) {
          res = [left, right];
          resLen = currSubStrLen;
        }

        // now if have and need are same
        // means we have a string which can be the result
        // but we need shrink the res string using left and right pointers

        // shrink string by removing characters from left
        String leftChar = s[left];
        window[leftChar] = (window[leftChar] ?? 0) - 1;

        // since we have update window character occurences we also
        // need to update have to make sure stop the skrinking
        if (countT.containsKey(leftChar) &&
            (window[leftChar] ?? 0) < (countT[leftChar] ?? 0)) {
          have--;
        }
        // update left pointer since we have shrinked the sub string
        left++;
      }
    }

    // return result

    if (resLen == MaxValue) return "";

    String resStr = "";
    try {
      //   print("left = ${res[0]} right ${res[1]}");
      resStr = s.substring(res[0], res[1] + 1);
    } catch (e) {}
    ;
    return resStr;
  }

  int uniqueCharactersOf(String s) {
    Set<String> set = {};
    for (int i = 0; i < s.length; i++) {
      set.add(s[i]);
    }
    return set.length;
  }
}
