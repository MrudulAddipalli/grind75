
# Solution - https://www.youtube.com/watch?v=fMSJSS7eO1w

from ast import List


# Time - O(N x N) + O(N x N) -- O(N^2)
class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
      # transpose - https://media.geeksforgeeks.org/wp-content/cdn-uploads/matrix-transpose.jpg
      for row in range(len(matrix)):
          for col in range(row,len(matrix)):
              temp = matrix[row][col]
              matrix[row][col] = matrix[col][row]
              matrix[col][row] = temp

      # #reverse
      for row in matrix:
          row.reverse()
          

# Time - O(N x N) -- O(N^2)
class Solution2:
    def rotate(self, matrix: List[List[int]]) -> None:

      l, r = 0, len(matrix) - 1

      while (l < r):
        for i in range(r - l):
          top, bottom = l, r

          # save the topLeft
          topLeft = matrix[top][l + i]

          # move bottom left intp top left
          matrix[top][l + i] = matrix[bottom - i][l]

          # move bottom right into bottom left
          matrix[bottom - 1][l] = matrix[bottom][r - i]

          # move top right into bottom right
          matrix[bottom][r - i] = matrix[top + i][r]

          # move top left into top right
          matrix[top + i][r] = topLeft
        l += 1
        r -= 1

