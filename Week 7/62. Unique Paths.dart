// Solution - https://leetcode.com/problems/unique-paths/discuss/1581998/C%2B%2BPython-5-Simple-Solutions-w-Explanation-or-Optimization-from-Brute-Force-to-DP-to-Math
// Solution - https://www.youtube.com/watch?v=IlEsdxuD4lY

// Time - O(MxN)
// Space - O(m)

// Runtime: 402 ms, faster than 81.48% of Dart online submissions for Unique Paths.
// Memory Usage: 139.9 MB, less than 88.89% of Dart online submissions for Unique Paths.

// Memoization + DP
class Solution {
  int uniquePaths(int m, int n) {
    List<int> bottomRow = List.filled(n, 1);
    // no need to check for bottom side cells
    // hence m-1, because mat[m-1][n-1] , or mat[m-2][n-1] will always ne 1
    // which we are storing in bottomRow which we created
    for(int i=0;i<m-1;i++){

      // now we are going to above cells one by one and filling default values as 1
      List<int> aboveRow = List.filled(n, 1);
      // - 2 because , top right hand side cells will always be 1
      // so to use i+1 and to avoid index issue we start from -2 [ exclusing last element ]
      for(int j=n-1-1;j>=0;j--){
        aboveRow[j] = aboveRow[j+1] + bottomRow[j];
      }
      // update bottomRow with aboveRow
      bottomRow = aboveRow;
    }
    return bottomRow[0];
  }
}