
# Solution - https://www.youtube.com/watch?v=y704fEOx0s0

from ast import List
from collections import deque


class Solution:
    def orangesRotting(self, grid: List[List[int]]) -> int:
        q = deque()
        times, fresh = 0, 0

        ROWS, COLS = len(grid), len(grid[0])

        # counting all fresh oranges so that if any fresh orange remains unrotten then we need to return -1
        # storing all initial rotten oranges in queue to perform BFS on them - each oranges check counts as
        # times 1
        for r in range(ROWS):
            for c in range(COLS):

                if grid[r][c] == 1:
                    fresh += 1

                if grid[r][c] == 2:
                    q.append([r, c])

        # array for directly getting all 4 directions in single operation
        directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]

        # while q is not empty and remaining fresh oranges are 0, means no unrotten oranges left, hence break flow - improvement
        while q and fresh > 0:

            # this for loop is main logic / deal breaker
            # looping through initially found rotten oranges to count this loop as times +1,
            # because oranges in other place can rotten it's neighbor and will not wait 
            # for other rotten orange to rotten neighbouring oranges
            for i in range(len(q)):
                r, c = q.popleft()

                # traversing in all direction to rotten neighbouting oranges
                for dr, dc in directions:
                    row, col = r + dr, c + dc

                    # if grid is not under bound and current orange is not fresh orange
                    # if this satisfies then we don't need to do anything
                    # we can go to other rotten oranges to find neighbouring fresh oranges
                    if (row < 0 or row == ROWS or col < 0 or col == COLS or grid[row][col] != 1):
                        # continue will break the for and move to next element in directions
                        continue

                    # if continue does not execute this will get executed
                    # marking fresh orange as rotten
                    grid[row][col] == 2

                    # adding neighbouring rotten oranges for next BFS traversal
                    q.append([row, col])

                    # decreaming fresh oranges count
                    fresh -= 1

            # oranges in other place can rotten it's neighbor and will not wait for other rotten orange to rotten neighbouring oranges
            times += 1

        # if fresh is not 0 means there are fresh oranges remaining hence return -1 or return times it took
        # to rotten all oranges
        return times if fresh == 0 else -1
