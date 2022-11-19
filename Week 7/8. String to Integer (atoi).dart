class Solution {
  int myAtoi(String s) {
    int num = 0;
    bool isNegative = false;
    for (int i = 0; i < s.length; i++) {
      int num1 = int.parse(s[i], onError: (source) => 0);

      // now check for future space and end string
      if (s[i] == " " && num != 0) {
        print("Space found at $i");
        return actualNum(num, isNegative);
      }

      if (num1 != 0) {
        // first number will be found here at index i
        // so check if the number has negative of not
        if (i >= 1 && i <= s.length && s[i - 1] == "-") {
          print("Char at s[i-1] is {${s[i - 1]}}");
          isNegative = true;
          print("isNegative - $isNegative");
        }
        num = (num * 10) + num1;
        print("Current num - $num");
      }
    }

    return actualNum(num, isNegative);
  }

  int actualNum(int num, bool isNegative) {
    print("Returning Num - $num and isNegative is $isNegative");
    // negating result
    if (isNegative) num = num * -1;
    print("Final num $num");
    return num;
  }
}

void main() {
  print('Result === ${Solution().myAtoi("__  -4193 4193 words")}');
}
