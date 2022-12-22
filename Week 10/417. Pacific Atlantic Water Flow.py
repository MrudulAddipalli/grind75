# Solution - https://www.youtube.com/watch?v=s-VkcjHqkGI

from ast import List
class Solution:
    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
      res = []
      ROWS = len(heights)
      COLS = len(heights[0])
      atlantic = set()
      pacific = set()

      def dfs(r, c, visitSet, previousHeight):
        # cell should not be visited
        if (((r, c) in visitSet)
            or r < 0 or r == ROWS or c < 0 or c == COLS or
            # since we are going from ocean to top
            # previous height should be less then current,
            # if not return
                heights[r][c] < previousHeight):
          return

        # MARK VISITED
        visitSet.add((r, c))

        # traverse in all direction
        dfs(r+1, c, visitSet, heights[r][c])
        dfs(r-1, c, visitSet, heights[r][c])
        dfs(r, c+1, visitSet, heights[r][c])
        dfs(r, c-1, visitSet, heights[r][c])

      # top - pacific and bottom - atlantic
      for c in range(COLS):
        dfs(0, c, pacific, heights[0][c])
        dfs(ROWS-1, c, atlantic, heights[ROWS-1][c])

      # left - pacific and right - atlantic
      for r in range(ROWS):
        dfs(r, 0, pacific, heights[r][0])
        dfs(r, COLS-1, atlantic, heights[r][COLS-1])

      # finding cells from where water can reach both oceans
      for r in range(ROWS):
        for c in range(COLS):
          if ((r, c) in atlantic) and ((r, c) in pacific):
            res.append([r, c])

      return res
