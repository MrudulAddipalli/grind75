// Solution - https://www.youtube.com/watch?v=s9fokUqJ76A

class Solution {
  List<String> generateParenthesis(int n) {
    // Algo
    // only add open paranthesis if open < n
    // only add a closing paranthesis if closed < open
    // stack is valid if open == closed == n

    List<String> res = [];
    List<String> stack = [];

    void backtrack(int openCount, int closeCount) {
      // correct res found
      if ((openCount == closeCount) && (openCount == n) && (closeCount == n)) {
        res.add(stack.join(""));
        return;
      }

      // more open paranthesis remaining to be added
      if (openCount < n) {
        stack.add("(");
        backtrack(openCount + 1, closeCount);
        // ()( "(" 
        // ()()() 
        // ()(())
        stack.removeLast();
      }

      // more closed paranthesis remaining to be added
      if (closeCount < openCount) {
        stack.add(")");
        backtrack(openCount, closeCount + 1);
        stack.removeLast();
      }
    }

    backtrack(0, 0);
    return res;
  }
}
