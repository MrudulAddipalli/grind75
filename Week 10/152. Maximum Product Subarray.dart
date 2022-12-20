// Solution - https://www.youtube.com/watch?v=lXVy6YWFcRM

// Time - O(nLogn + n) - O(nLogn)
// Space - O(1)

// kadane's Algorithm

class Solution {
  int maxProduct(List<int> nums) {
    // if we have [-1] then we should not take default value as 1
    int res = maxOflist(nums);
    int currMin = 1, currMax = 1;

    for (int n in nums) {
      if (n == 0) {
        currMin = currMax = 1;
        continue;
      }

      final _max = n * currMax;
      final _min = n * currMin;
      currMax = maxOf3(_max, _min, n);
      currMin = minOf3(_max, _min, n);
      res = maxOf2(res, currMax);
    }

    return res;
  }

  int maxOf3(int a, int b, int c) => (a > b && a > c)
      ? a
      : (b > c)
          ? b
          : c;
  int maxOf2(int a, int b) => a > b ? a : b;
  int minOf3(int a, int b, int c) => (a < b && a < c)
      ? a
      : (b < c)
          ? b
          : c;
  int maxOflist(List<int> arr) {
    if (arr.isEmpty) return -1;
    // array copy is imp cause otherwise it will treat it as copy by ref
    final sortNums = [...arr];
    sortNums.sort();
    // storing max value from array
    return sortNums.last;
  }
}

// Not working for [-3,-1,-1]
class Solution2 {
  int maxProduct(List<int> nums) {
    int product = 1;

    // array copy is imp cause otherwise it will treat it as copy by ref
    final sortNums = [...nums];
    sortNums.sort();
    // storing max value from array
    int maxProduct = sortNums.last;

    for (int i = 0; i < nums.length; i++) {
      if (product <= 0 || nums[i] <= 0) {
        product = 1;
      }
      product = product * nums[i];
      maxProduct = max(maxProduct, product);
    }
    return maxProduct;
  }

  int max(int a, int b) => a > b ? a : b;
}
