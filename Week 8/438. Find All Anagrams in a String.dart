import '../Week 1/242. Valid Anagram.dart' as Anagram;

// Sliding Window Solution
// Solution - https://www.youtube.com/watch?v=G8xtZy0fDKg

// Time - O(sLen)
// Space - O(n)

// Runtime: 696 ms, faster than 37.50% of Dart online submissions for Find All Anagrams in a String.
// Memory Usage: 149.5 MB, less than 37.50% of Dart online submissions for Find All Anagrams in a String.

class Solution {
  List<int> findAnagrams(String s, String p) {
    int sLen = s.length, pLen = p.length;
    // Base Case
    if (pLen > sLen) return [];
    List<int> res = [];
    Map<String, int> sCount = {}, pCount = {};
    for (int i = 0; i < p.length; i++) {
      pCount[p[i]] = 1 + (pCount[p[i]] ?? 0);
      // calculating start chars in same loop
      sCount[s[i]] = 1 + (sCount[s[i]] ?? 0);
    }

    // deciding if initial characters are anagram my matching both maps
    if(mapEquals(sCount, pCount)) res = [0];

    int left = 0;
    // since pre calculated start chars in above loop hence starting this loop from pLen
    for (int right = pLen; right < sLen; right++) {
      sCount[s[right]] = 1 + (sCount[s[right]] ?? 0);
      sCount[s[left]] = (sCount[s[left]] ?? 0) - 1;
      if (sCount[s[left]] == 0) {
        // if don't remove use less key then mapEquals will return false even when key is present
        // since in first condition we check for keys lenght of both map
        sCount.remove(s[left]);
      }
      left++;
      if (mapEquals(sCount, pCount)) {
        res.add(left);
      }
    }
    return res;
  }

  bool mapEquals(Map<String, int> map1, Map<String, int> map2) {
    if (map1.keys.length != map2.keys.length) return false;
    for (String k in map2.keys) {
      if (!map1.containsKey(k)) return false;
      if (map1[k] != map2[k]) return false;
    }
    return true;
  }
}
// Brute Force Approach
// Time - O(S x P)

class Solution2 {
  List<int> findAnagrams(String s, String p) {
    List<int> res = [];
    int sLen = s.length, pLen = p.length;

    // Base Case
    if (pLen > sLen) return res;

    for (int i = 0; i <= s.length - pLen; i++) {
      bool ress = Anagram.Solution().isAnagram(s.substring(i, pLen + i), p);
      if (ress == true) {
        print("res - $ress");
        res.add(i);
      }
    }

    return res;
  }
}

void main() {
  print("Result - ${Solution().findAnagrams("cbaebabacd", "abc")}");
}
