
// Solution - https://www.youtube.com/watch?v=g9YQyYi4IQQ

// Time - O(Log n base 2) - 83.33% [ log n base 2 - means how many times we can divide n by 2 ] 
// Space O(1) - 16.67%

class Solution {
  double myPow(double x, int n) {
    double helper(double x, int n) {
      if (x == 0) return 0;
      if (n == 0) return 1;

      double res = helper(x, n ~/ 2);
      res = res * res;
      // odd
      if (n % 2 == 1) {
        return x * res;
      }
      return res;
    }

    double res = helper(x, abs(n));
    if (n > 0) return res;
    return 1 / res;
  }

  int abs(int x) => x < 0 ? -1 * x : x;
}

class SolutionMyApproach {
  double myPow(double x, int n) {
    // maintain sign of x
    bool isNumberNegative = false;
    bool isPowerNegative = false;

    if (x < 0) {
      isNumberNegative = true;
      x = -1 * x;
    }

    // for leetcode
    if (x > 0.0 && x < 1.0) {
//             find Decimals
      String decimals = x.toString().split(".").last;

      int numberOfZeros = 0;

      int i = 0;

      for (i = 0; i < decimals.length; i++) {
        if (decimals[i] == "0") {
          numberOfZeros++;
        } else {
          break;
        }
      }
      // find remaining number
      String number = "";
      for (int j = i; j < decimals.length; j++) {
        number += decimals[j];
      }
      print("orignal x - $x, n - $n");
      print("decimals - $decimals");
      print("numberOfZeros - $numberOfZeros");
      print("decimal number - $number");
      x = double.parse(number);
      n = n - numberOfZeros;

      print("final - x - $x,  final n - $n");
    }

    if (n < 0) {
      isPowerNegative = true;
      n = -1 * n;
    }

    double value = x;
    for (int i = 1; i < n; i++) {
      value *= x;
    }
    if (isPowerNegative) value = 1 / value;

    if (isNumberNegative) {
      // check if n is even or not
      if (n % 2 == 0) {
        isNumberNegative = false;
      }
    }

    return isNumberNegative ? (-1 * value) : value;
  }
}

void main() {
  print("${Solution().myPow(0.44894, -5)}");
  print("${Solution().myPow(-322, 0)}");
  print("${Solution().myPow(0.0000003403, 2342352)}");
  print("${Solution().myPow(3, 3)}");
  print("${Solution().myPow(2, 10)}");
  print("${Solution().myPow(2.1, 3)}");
  print("${Solution().myPow(2, -2)}");
  print("${Solution().myPow(-12, 2)}");
  print("${Solution().myPow(-12, 3)}");
}
