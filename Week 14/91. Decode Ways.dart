// Solution - https://www.youtube.com/watch?v=9Ky-lgdaJUE

// Recursive - Time Limit Exceeded - because for same index we are doing recursive again,
// this repeatative calls can be reduced using cache i.e with Recursive + Memoization

// Time - 100%
// Space - 100%

class SolutionOnlyRecursive {
  int numDecodings(String s) {
    // inner function
    int numDecode(int index) {
      if (index == s.length) return 1;
      // here index may have value more the (s.lenght - 1), but we have handled that in above if case
      // checking "0" cause as per requirement we will not consider 01 as A, only 1 will be considered as A
      if (s[index] == "0") return 0;
      if (index == s.length - 1) return 1;
      int way1 = numDecode(index + 1);
      int way2 = 0;
      // their might we case the 2 digits gives 27, which has no character mapping
      if (int.parse(s.substring(index, index + 2)) <= 26) {
        way2 = numDecode(index + 2);
      }
      return way1 + way2;
    }

    return numDecode(0);
  }
}

class SolutionOnlyRecursiveAndMemoization {
  int numDecodings(String s) {
    Map<int, int> cache = {};
    // inner function
    int numDecode(int index) {
      if (index == s.length) return 1;
      // here index may have value more the (s.lenght - 1), but we have handled that in above if case
      // checking "0" cause as per requirement we will not consider 01 as A, only 1 will be considered as A
      if (s[index] == "0") return 0;
      if (index == s.length - 1) return 1;

      //
      if ((cache[index] ?? 0) > 0) {
        return cache[index]!;
      }

      int way1 = numDecode(index + 1);
      int way2 = 0;
      // their might we case the 2 digits gives 27, which has no character mapping
      if (int.parse(s.substring(index, index + 2)) <= 26) {
        way2 = numDecode(index + 2);
      }
      final int ways = way1 + way2;
      cache[index] = ways;
      return cache[index]!;
    }

    return numDecode(0);
  }
}
