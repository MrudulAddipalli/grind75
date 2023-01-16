
# My Approach
# Start from 0,0
# check 1x1, 2x2, 3x3, 4x4, 5x5 ,... at each index
# while checking each squares from each point make sure all elements are 1
# if all are 1, then save m or n in max = Math.max(max, M), as we have square of m x n, i,e m == n
# Optimisation - since we are doing top down approach
# before going to check if all cells are 1 in m x n sqaure, just validate if current (x,y), right
# and bottom are 1 or not,
# with this we can reduce several iterations
# Time Complexity - O ( (M x N)^2 ) ---- O( M^2 x N^2 )


# Bottom Up Approach 
# Time Complexity - O(MxN + MxN) - O(MxN)
# Solution - 

from ast import List
class Solution:
    def maximalSquare(self, matrix: List[List[str]]) -> int:
      ROW, COL = len(matrix), len(matrix[0])
      cache = {} # map each (r,c) -> maxLenght of square

      def _helper(r,c):
        # out of bound
        if r >= ROW or c >= COL:
          return 0  

        if (r,c) not in cache:
          down = _helper(r,c+1)
          right = _helper(r+1,c)
          diag = _helper(r+1,c+1)

          # default value , either it will be 0 or 1
          cache[(r,c)] = 0
          if matrix[r][c] == "1":
            cache[(r,c)] = 1 + min(down,right,diag) 
            # if any of 3 is 0, we will add 0
            # which will keep original value as 1 [ 1 only if matric[r][c] == "1"] else 0

        # Optimisation
        return cache[(r,c)]
      
      _helper(0,0)

      # squaring lenght 
      return max(cache.values()) ** 2
