// You are given an m x n integer matrix matrix with the following two properties:

// Each row is sorted in non-decreasing order.
// The first integer of each row is greater than the last integer of the previous row.
// Given an integer target, return true if target is in matrix or false otherwise.

// You must write a solution in O(log(m * n)) time complexity.

// Naive Approach
// Time Complexity - O(logm * logn) - O(log(mxn)) - 60%
// Space Complexity - O(1) - 40%

class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    int rows = matrix.length;
    int cols = matrix[0].length;

    // find exact row using binary search
    int top = 0, bot = rows - 1;

    while (top <= bot) {
      int row = (top + bot) ~/ 2;
      if (target > matrix[row].last) {
        top = row + 1;
      } else if (target < matrix[row].first) {
        bot = row - 1;
      } else {
        break;
      }
    }

    // abovr while loop didn't run, means we didn't find row
    if (top > bot) {
      return false;
    }

    // founded the exact row
    int exactRow = (top + bot) ~/ 2;

    // find element in exactRow using binary search

    int l = 0, r = cols - 1;
    while (l <= r) {
      int mid = (l + r) ~/ 2;
      if (target > matrix[exactRow][mid]) {
        l = mid + 1;
      } else if (target < matrix[exactRow][mid]) {
        r = mid - 1;
      } else {
        return true;
      }
    }

    return false;
  }
}

void main() {
  print("${Solution().searchMatrix([
        [-6, -5, -4, -3],
        [-1, 3, 5, 10],
        [12, 18, 34, 60]
      ], -4)}");
}
