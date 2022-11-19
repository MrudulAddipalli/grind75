class Solution {
  int myAtoi(String s) {
    String returnString = '';
    s = s.trim();

    for (int i = 0; i < s.length; i++) {
      String char = s.substring(i, i + 1);
      // handles negative
      if (i == 0) {
        if (char == '-') {
          returnString += '-';
          continue;
        }
      }

      // breaks when encountering first non-numeric char
      if (isNumeric(char)) {
        returnString += char;
      } else
        break;
    }

    if (returnString.length == 0) return 0;

    print("returnString is $returnString");

    /// expets a string s, which will be converted to number
    /// returns numeric part of string, or MAX_INT or MIN_INT if
    /// int is over 32-bit signed
    /// does not support doubles
    int MAX_INT = 2147483647;
    int MIN_INT = -2147483648;
    // dart's int is 64 bit, so we're returning 32-bit as per problem spec, or int overflow
    try {
      int returnInt = int.parse(returnString);
      if (returnInt > MAX_INT) return MAX_INT;
      if (returnInt < MIN_INT) return MIN_INT;
      return returnInt;
    } on FormatException {
      return 0;
    }
  }

  bool isNumeric(String s) {
    /// expects a String of length 1; a single char
    /// returns true if s is numeric, false otherwise

    return s == "0" ||
        s == "1" ||
        s == "2" ||
        s == "3" ||
        s == "4" ||
        s == "5" ||
        s == "6" ||
        s == "7" ||
        s == "8" ||
        s == "9" || s == "+";
  }
}


void main() {
  int result = Solution().myAtoi("20000000000000000000");
  print('Text Case 1 - ${result == 2147483647}');
  
  result = Solution().myAtoi("+1");
  print('Text Case 12 - ${result == 1}');
  
  result = Solution().myAtoi("words and 987");
  print('Text Case 13 - ${result == 0}');

  result = Solution().myAtoi("   -42");
  print('Text Case 2 - ${result == -42}');

  result = Solution().myAtoi("42");
  print('Text Case 3 - ${result == 42}');

  result = Solution().myAtoi("  -4193 4193 words");
  print('Text Case 4 - ${result == -4193}');

  result = Solution().myAtoi("-4193 words");
  print('Text Case 5 - ${result == -4193}');

  result = Solution().myAtoi("-+12");
  print('Text Case 5 - ${result == 0}');
}
