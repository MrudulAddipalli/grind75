// Solution - https://www.youtube.com/watch?v=AIhyd8lMpIo
// https://www.geeksforgeeks.org/length-of-the-longest-valid-substring/

// Time - O(n)
// Space - O(n)

class Solution {
  int longestValidParentheses(String s) {
    int n = s.length;

    // Create a stack and push -1
    // as initial index to it.
    List<int> stack = [];
    stack.add(-1);
    // Initialize result
    int result = 0;
    // Traverse all characters of given string
    for (int i = 0; i < n; i++) {
      // If opening bracket, push index of it
      if (s[i] == '(')
        stack.add(i);
      // // If closing bracket, i.e.,s[i] = ')'
      else {
        // Pop the previous
        // opening bracket's index
        if (!stack.isEmpty) stack.removeLast();
        // Check if this length
        // formed with base of
        // current valid substring
        // is more than max
        // so far
        if (!stack.isEmpty) result = max(result, i - stack.elementAt(stack.length - 1));
        // If stack is empty. push
        // current index as base
        // for next valid substring (if any)
        else stack.add(i);
      }
    }

    return result;
  }

  int max(int a, int b) => a > b ? a : b;
}
