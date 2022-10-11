// This is dynamic programming approch better than DFS and BFS

// Runtime: 1081 ms, faster than 50.00% of Dart online submissions for 01 Matrix.
// Memory Usage: 182.1 MB, less than 50.00% of Dart online submissions for 01 Matrix.

// Time Complexity - O(M x N)
// Space Complexity - O(1)

// Solution - https://www.youtube.com/watch?v=RySXom_lslY&t=578s
// start at t-578s
class Solution {

  List<List<int>> updateMatrix(List<List<int>> mat) {
    int m = mat.length, n = mat[0].length, MAX = 100000;
    // top - left
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        // if current element is zero then nearest zero is always 0, i.e itself
        if (mat[i][j] != 0) {
          // top - left
          int top = (i - 1 >= 0) ? mat[i - 1][j] : MAX;
          int left = (j - 1 >= 0) ? mat[i][j - 1] : MAX;
          mat[i][j] = min(top, left);
        }
      }
    }

    // bottom - right
    for (int i = m - 1; i >= 0; i--) {
      for (int j = n - 1; j >= 0; j--) {
        // if current element is zero then nearest zero is always 0, i.e itself
        if (mat[i][j] != 0) {
          // bottom - right
          int bottom = (i + 1 < m) ? mat[i + 1][j] : MAX;
          int right = (j + 1 < n) ? mat[i][j + 1] : MAX;
          mat[i][j] = min(bottom, right);
        }
      }
    }

    // printing array
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        print("$i $j - ${mat[i][j]}");
      }
    }

    return mat;
  }

  int min(int a, int b) {
    return a < b ? a : b;
  }
}

void main() {
  print("Final Array - ${Solution().updateMatrix([
        [0, 0, 0],
        [0, 1, 0],
        [1, 1, 1]
      ])}");
}
