# Time - O(MxN)
# Space - O(M)

# Solution - https://www.youtube.com/watch?v=pV2kpPD66nE


import collections


class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        if not grid:
            return 0

        rows, cols = len(grid), len(grid[0])
        visitedLand = set()
        islands = 0

        def bfs(x, y):
            # queue for BFS algorithm
            visitingAreasQueue = collections.deque()

            # array for storing all visited lands
            visitedLand.add((x, y))

            # queues for breadth first search on dependent ares
            visitingAreasQueue.append((x, y))

            # while visitingAreasQueue queue is not empty
            while visitingAreasQueue:
                row, col = visitingAreasQueue.popleft()

                # array for directly getting all 4 directions in single operation
                directions = [[1, 0], [-1, 0], [0, 1], [0, -1]]

                for dr, dc in directions:
                    r, c = row + dr, col + dc

                    if (r in range(rows) and c in range(cols) and grid[r][c] == "1" and (r, c) not in visitedLand):
                        # appending 4 directions in queue to check if there are surrounded by land or not
                        visitingAreasQueue.append((r, c))
                        visitedLand.add((r, c))

        for x in range(rows):
            for y in range(cols):
                if grid[x][y] == "1" and (x, y) not in visitedLand:
                    # we just visit all lands and count islands + 1
                    # we don't check for bfs result because we have condition check of == "1" in above for loop
                    # hence it will not satisfy condition
                    # since 1 is found means atleast 1 island is available
                    bfs(x, y)
                    islands += 1

        return islands
