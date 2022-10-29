class Solution {
  int evalRPN(List<String> tokens) {
    int res = 0, i = 0;
    while (i >= 0) {
      print("I is at $i --- ");
      print(" --- ${tokens[i]}");
      switch (tokens[i]) {
        case "+":
          {
            print("Adding ${tokens[i - 2]} and ${tokens[i - 1]}");
            res = int.parse(tokens[i - 2]) + int.parse(tokens[i - 1]);
            print("res - $res");
            tokens.removeAt(i - 2);
            tokens.removeAt(i - 2);
            // tokens.removeAt(i-2);
            // since we don't have addAt hence instead of removing operator we will update result in that place
            tokens[i - 2] = "$res";
            print("Tokens -  $tokens");
            i = i - 2;
            break;
          }
        case "-":
          {
            print("Substracting ${tokens[i - 2]} and ${tokens[i - 1]}");
            res = int.parse(tokens[i - 2]) - int.parse(tokens[i - 1]);
            print("res - $res");
            tokens.removeAt(i - 2);
            tokens.removeAt(i - 2);
            // tokens.removeAt(i-2);
            // since we don't have addAt hence instead of removing operator we will update result in that place
            tokens[i - 2] = "$res";
            print("Tokens -  $tokens");
            i = i - 2;
            break;
          }
        case "*":
          {
            print("Multiplying ${tokens[i - 2]} and ${tokens[i - 1]}");
            res = int.parse(tokens[i - 2]) * int.parse(tokens[i - 1]);
            print("res - $res");
            tokens.removeAt(i - 2);
            tokens.removeAt(i - 2);
            // tokens.removeAt(i-2);
            // since we don't have addAt hence instead of removing operator we will update result in that place
            tokens[i - 2] = "$res";
            print("Tokens -  $tokens");
            i = i - 2;
            break;
          }
        case "/":
          {
            print("Dividing ${tokens[i - 2]} and ${tokens[i - 1]}");
            res = int.parse(tokens[i - 2]) ~/ int.parse(tokens[i - 1]);
            print("res - $res");
            tokens.removeAt(i - 2);
            tokens.removeAt(i - 2);
            // tokens.removeAt(i-2);
            // since we don't have addAt hence instead of removing operator we will update result in that place
            tokens[i - 2] = "$res";
            print("Tokens -  $tokens");
            i = i - 2;
            break;
          }
      }
      // breakpoint
      if (i == 0 && tokens.length == 1) {
        // for while (i >= 0) condition break
        i = -1;
      } else {
        i++;
      }
    }
    return res;
  }
}

void main() {
  print("Result - ${Solution().evalRPN(
    ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"],
  )}");
}
