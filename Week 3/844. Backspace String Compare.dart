// void main() async {
//   print(remove("ab#c") == remove("ac#c"));
// }

// String remove(String word){
//   if(word.isEmpty) return word;
//   // find #
//   int i=0;
//   for(i=0; i< word.length;i++){
//     if(word[i] == "#") break;
//   }
//   if(i == word.length) return word;
//   word = word.substring(0,i-1) + word.substring(i+1,word.length);
//   return remove(word);
// }


// Runtime: 448 ms, faster than 75.00% of Dart online submissions for Backspace String Compare.
// Memory Usage: 140.9 MB, less than 91.67% of Dart online submissions for Backspace String Compare.

// Time Complexity - O(n) + O(n) - O(n)
// Space Complexity - O(1)


// same can be done using stack, instead of subString , we will pop and instead of += we will push()
class Solution {
  bool backspaceCompare(String s, String t) {
    String one = "", two = "";
    int i = 0;

    for (i = 0; i < s.length; i++) {
      if (s[i] != "#") {
        one += s[i];
      } else {
        // removing last added string
        if (one.isNotEmpty) one = one.substring(0, one.length - 1);
      }
    }

    for (i = 0; i < t.length; i++) {
      if (t[i] != "#") {
        two += t[i];
      } else {
        // removing last added string
        if (two.isNotEmpty) two = two.substring(0, two.length - 1);
      }
    }
    print("one - $one, two - $two");
    return one == two;
  }
}

void main() {
  print(Solution().backspaceCompare("ab#c", "ad#c"));
}
