// https://www.youtube.com/watch?v=Y0lT9Fck7qI

class Solution {
  int climbStairs(int n) {
    int last = 1, secondLast = 1, temp = 0, i = 0;
    for (i = 0; i < n - 1; i++) {
      // Fibonacci Series
      temp = last + secondLast;
      last = secondLast;
      secondLast = temp;
    }
    return secondLast;
  }
}

// 1 + 1 + 1 + 1 + 1
// 1 + 2 + 1 + 1
// 1 + 2 + 2
// 2 + 2 + 1
// 2 + 1 + 2
// 2 + 1 + 1 + 1
// 1 + 1 + 2 + 1
// 1 + 1 + 1 + 2

void main() {
  print("Status - ${Solution().climbStairs(5)}");
}
