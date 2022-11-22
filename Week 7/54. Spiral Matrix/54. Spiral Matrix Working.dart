// Solution - https://www.youtube.com/watch?v=BJnMZNwUk1M&t=380s

// Time - O(MxN)
// Space - O(1) , not considering result for space or else O(MxN)

// Runtime: 394 ms, faster than 92.86% of Dart online submissions for Spiral Matrix.
// Memory Usage: 140.4 MB, less than 50.00% of Dart online submissions for Spiral Matrix.

class Solution {
  List<int> spiralOrder(List<List<int>> matrix) {
    List<int> res = [];
    int left = 0, right = matrix[0].length, top = 0, bottom = matrix.length;

    while (left < right && top < bottom) {
      // get every i in the top row
      for (int i = left; i < right; i++) res.add(matrix[top][i]);
      top += 1;

      // get every i in the right col
      for (int i = top; i < bottom; i++) res.add(matrix[i][right - 1]);
      right -= 1;

      // case for 1X3 and 3X1 matrix
      if (!(left < right && top < bottom)) break;

      // get every i in the bottom row
      for (int i = right - 1; i > left - 1; i--) res.add(matrix[bottom - 1][i]);
      bottom -= 1;

      // get every i in the left col
      for (int i = bottom - 1; i > top - 1; i--) res.add(matrix[i][left]);
      left += 1;
    }
    return res;
  }
}
