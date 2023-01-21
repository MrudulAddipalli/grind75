# Input: x = 123
# Output: 321

# Input: x = -123
# Output: -321

# Input: x = 120
# Output: 21

# Note: Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

# My Solution
# dartpad will take long int as 1e-7...
# in leetcode it takes entire integar as  2147483648 - 1 --- 2147483647
# so as per leetcode,
# convert int to string
# check first character if it's -, means number is negative, and store numberNegative = true
# if it's -ve no, then remove - from string,
# now reverse string
# check  numberNegative is true add "-" at start of string
# return int.parse(string)

# also one edge case if we reverse 2147483647, we get 7463847412, which is more than 2^31-1
# if it's more then return 0;

# Solution - https//www.youtube.com/watch?v=HAgLH58IgJQ


# this dart solution is not working because of -1 % 10 , should -1 instead of 9
# -1 ~/ 10 is working fine in dart
# class DartSolution {
#   int reverse(int x) {
#     int MIN = -2147483648; # -2^31
#     int MAX = 2147483647; # -2^31 - 1
#     int res = 0;
#     while (x >= 0) {
#       int digit = x % 10;
#       x = x ~/ 10;
#       if ((res > MAX ~/ 10) || (res == MAX ~/ 10 && digit >= MAX % 10))
#         return 0;
#       if ((res < MIN ~/ 10) || (res == MIN ~/ 10 && digit <= MIN % 10))
#         return 0;
#       res = (res * 10) + digit;
#     }
#     return res;
#   }
# }

import math


class Solution:
    def reverse(self, x: int) -> int:
        MIN = -2147483648  # -2^31
        MAX = 2147483647  # -2^31 - 1
        res = 0
        while x:
            # Main change
            digit = int(math.fmod(x, 10))
            x = int(x/10)
            if (res > MAX // 10) or (res == MAX // 10 and digit >= MAX % 10):
                return 0
            if (res < MIN // 10) or (res == MIN // 10 and digit <= MIN % 10):
                return 0
            res = (res * 10) + digit
        return res
