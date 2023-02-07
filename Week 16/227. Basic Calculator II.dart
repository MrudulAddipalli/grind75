// Solution - https://www.youtube.com/watch?v=o2kXcAliqMU

// Time - O(n) - 100%
// Space - O(n) - 100%

class Solution {
  int calculate(String s) {
    int len = s.length;
    // base case
    if (len == 0) return 0;
    List<int> stack = [];
    int currentNumber = 0;
    String operation = '+';

    for (int i = 0; i < len; i++) {
      String currentChar = s[i];
      print('\n\n\ncurrentChar is - $currentChar');
      if (isDigit(currentChar)) {
        currentNumber = (currentNumber * 10) + int.parse(currentChar);
        print("currentNumber is $currentNumber");
      }
      if (!isDigit(currentChar) && !isWhitespace(currentChar) || i == len - 1) {
        print('currentChar is a operator - $currentChar');
        print("Need to do $operation operation");
        if (operation == '-') {
          stack.add(-currentNumber);
        } else if (operation == '+') {
          stack.add(currentNumber);
        } else if (operation == '*') {
          stack.add(stack.removeLast() * currentNumber);
        } else if (operation == '/') {
          stack.add(stack.removeLast() ~/ currentNumber);
        }

        operation = currentChar;
        currentNumber = 0;
        print("Current Stack is - $stack");
        print("currentNumber is - $currentNumber");
        print("Current operation is - $operation");
      }
    }
    int result = 0;
    while (!stack.isEmpty) {
      result += stack.removeLast();
    }
    return result;
  }

  bool isDigit(String currentChar) {
    return int.tryParse(currentChar) != null;
  }

  bool isWhitespace(String currentChar) {
    return currentChar == " ";
  }
}

void main() {
  Solution sol = Solution();
  print("calculate - ${sol.calculate("3+2*4")}");
}
