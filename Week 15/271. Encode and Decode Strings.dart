//
// Question - https://www.lintcode.com/problem/659/
// Solution - https://www.youtube.com/watch?v=B1k_sxOSgv8

// Time - O(n)
// Space - O(n)

/// Main Missing Logic in this solution
/// lenght of string can be more 9, in that our logic of adding + 2 will not work
/// 
class SolutionApproach1 {
  String encode(List<String> strs) {
    String res = "";
    for (String s in strs) {
      // for empty String we will add "0#" only
      res += "${s.length}#$s";
    }
    return res;
  }

  List<String> decode(String str) {
    List<String> res = [];
    for (int i = 0; i < str.length; i++) {
      int count = int.parse(str[i]);
      // base case for "" empty string, we will have "0#" only
      // i+2 to skip "count" and "#"
      i = i + 2;
      // subString end does not count end index
      String subStr = str.substring(i, i + count);
      res.add(subStr);
      // subString end does not count end index, hence reducing by 1
      i = i + count - 1;
    }
    return res;
  }
}

class SolutionApproach2Working {
  String encode(List<String> strs) {
    String res = "";
    for (String s in strs) {
      // for empty String we will add "0#" only
      res += "${s.length}#$s";
    }
    return res;
  }

  List<String> decode(String str) {
    List<String> res = [];
    for (int i = 0; i < str.length; i++) {
      int countStringLen = i;
      while (str[countStringLen] != "#") {
        countStringLen++;
      }
      int count = int.parse(str.substring(i, countStringLen));
      print("count  - $count at countStringLen - $countStringLen");
      // countStringLen + 1 to skip countStringLen and "#"
      i = countStringLen + 1;
      // subString end does not { i+count } end index
      String subStr = str.substring(i, i + count);
      print("subStr - $subStr");
      res.add(subStr);
      // subString end does not count end index, hence reducing by 1
      i = i + count - 1;
    }
    return res;
  }
}

void main() {
  SolutionApproach2Working sol = SolutionApproach2Working();
  String res = sol.encode([""]);
  print("Encoded String - $res");
  print("Decoded String - ${sol.decode(res)}");
}
