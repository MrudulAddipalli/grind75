
// Solution - https://www.youtube.com/watch?v=081AqOuasw0 Jessica Lin

class Solution {
  int calculate(String s) {
    int sign = 1;
    int sum = 0;
    List<int> stack = [];

    for (int i = 0; i < s.length; i++) {
      // need to handle
      // number
      // +
      // -
      // (
      // )

      // handling number
      if (s[i].isDigit) {
        // create number from string till we last digit
        // IMP Logic
        int num = 0;
        while (i < s.length && s[i].isDigit) {
          num = (num * 10) + s[i].toDigit;
          i++;
        }
        sum += sign * num;
        // since we do i++ in while loop, so we may miss sign or other character when forming number
        i--;
      }

      // handling +
      else if (s[i] == "+") {
        sign = 1;
      }
      // handling 1
      else if (s[i] == "-") {
        sign = -1;
      }
      // handling (
      else if (s[i] == "(") {
        // store sum and sign in stack
        stack.add(sum);
        stack.add(sign);
        // reset sum for evaluating sum of numbers between next ()
        sum = 0;
        sign = 1;
      }
      // handling )
      else if (s[i] == ")") {
        int sign = stack.removeLast();
        int lastsum = stack.removeLast();
        // this sum is sum of numbers in brackers or last number
        sum = sign * sum;
        sum = sum + lastsum;
      } else {
        // ignore spaces
      }
    }

    return sum;
  }
}

extension myextension on String {
  int get toDigit {
    int? num = int.tryParse(this);
    if (num != null) {
      return num;
    }
    return 0;
  }

  bool get isDigit {
    return int.tryParse(this) != null;
  }
}
