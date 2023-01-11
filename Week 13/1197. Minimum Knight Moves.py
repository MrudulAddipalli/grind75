import collections


class Solution:
    def minKnightMoves(self, x: int, y:int) -> int:
        directions = [(-2,1),(-1,2),(1,2),(2,1),(2,-1),(1,-2),(-1,-2),(-2,-1)]
        visited = set()
        visited.add((0,0))
        steps = 0

        # queue for BFS
        queue = collections.deque([(0,0)])

        while queue:

            for _ in range(len(queue)):
                curr_x, curr_y = queue.popleft()

                # target found
                if curr_x == x and curr_y == y:
                    return steps
                
                # move in all 8 directions
                for d in directions:
                    new_x = curr_x + d[0]
                    new_y = curr_y + d[1]

                    if (new_x,new_y) not in visited and (-2 <= new_x <= x+2) and (-2 <= new_y <= y+2):
                        queue.append((new_x,new_y))
                        visited.add((new_x,new_y))

            steps += 1;        