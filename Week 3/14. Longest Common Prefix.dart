
// Runtime: 373 ms, faster than 84.80% of Dart online submissions for Longest Common Prefix.
// Memory Usage: 140.9 MB, less than 96.80% of Dart online submissions for Longest Common Prefix.

class Solution {
  String longestCommonPrefix(List<String> strs) {
    int len = strs.length;
    if (len == 0) return "";
    String result = "";
    String smallestString = strs.first;
    // loop for each Strings to find smallestString to avoid index issue
    for (int i = 0; i < len; i++) {
      if (smallestString.length > strs[i].length) {
        smallestString = strs[i];
      }
    }
    print("smallestString - $smallestString");
    int count = 0;
    for (int i = 0; i < smallestString.length; i++) {
      count = 0;
      // check for each charactor of smallestString in all strings of "strs"
      for (int stringIndex = 0; stringIndex < len; stringIndex++) {
        print("checking for ${strs[stringIndex][i]} in ${strs[stringIndex]}");
        if (strs[stringIndex][i] == smallestString[i]) {
          print(
              "matching ${strs[stringIndex][i]} and ${smallestString[i]}, smallestString[i] - ${smallestString[i]} count - $count");
          count++;
        }
      }
      if (count == len) {
        // means prefix exist in all strings
        result += smallestString[i];
      } else {
        // found a char at index i which is not present in all strings, means prefix not matching
        // hence returning current result
        return result;
      }
      print("current result - $result\n\n\n");
    }
    print("count - $count");
    return result;
  }
}

void main() {
  print("Final Result - ${Solution().longestCommonPrefix(["cir", "car"])}");
}