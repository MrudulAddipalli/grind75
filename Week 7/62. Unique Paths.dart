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


/// or

// More Optimised with single List
// def uniquePaths(self, m: int, n: int) -> int:
//         row = [0] * (n-1) + [1]
        
//         for i in range(m):
//             for j in range(n-2, -1, -1):
//                 row[j] += row[j+1]
        
//         return row[0]


/// or


// We need to take 6 steps right and 2 down, in various order.
// That means, a permutation of 2 sets of A == 6 and  B  == 2. 
// That means:  (A + B) !  /  (A! x B!)

// E.g.   8! / (2! x 6!) = 28.

// This is only possible because of the homogenity of the underlying graph (grid).
// The problem of high numbers can be addressed by cancelling out the common parts of the factorials. 
// Then it can be sped up by memoization.
// Even without that, this is faster than 82 %:

// class Solution {
//     fun uniquePaths(m: Int, n: Int): Int {
//         val a = m -1
//         val b = n-1
//         return ( fact(a + b) /  fact(a) / fact(b) ).toInt()
//     }
// }