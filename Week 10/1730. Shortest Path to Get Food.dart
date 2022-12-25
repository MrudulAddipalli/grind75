// Solution - https://www.youtube.com/watch?v=bY4I3pCZLTg
// Question - https://leetcode.ca/2021-03-13-1730-Shortest-Path-to-Get-Food/

// You are given an m x n character matrix, grid, of these different types of cells:

// '*' is your location. There is exactly one '*' cell.
// '#' is a food cell. There may be multiple food cells.
// 'O' is free space, and you can travel through these cells.
// 'X' is an obstacle, and you cannot travel through these cells.

// Approach - BFS , uses queue

// Note - set contains for list doesnot work in dart - so need to create own helper method for the same
class Solution {
  int shortestPath(List<List<int>> targetMap) {
    int ROWS = targetMap.length;
    int COLS = targetMap[0].length;
    List<List<int>> queue = [];
    Set<List<int>> visited = {};

    // find position of our location *
    for (int i = 0; i < ROWS; i++) {
      for (int j = 0; j < COLS; j++) {
        if (targetMap[i][j] == "*") {
          visited.add([i, j]);
          queue.add([i, j, 0]);
          break;
        }
      }
    }

    List<List<int>> directions = [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ];

    // BFS
    while (queue.isNotEmpty) {
      List<int> position = queue.removeAt(0);
      int row = position[0];
      int col = position[1];
      int steps = position[2];

      // found food
      if (targetMap[row][col] == "#") return steps;

      // traverse in all 4 directions only if it's not a obstacle and not already visited
      for (List<int> direction in directions) {
        int r = row + direction[0];
        int c = col + direction[1];

        if (
            // check if r,c is in boundary
            r >= 0 && r < ROWS && c >= 0 && c < COLS &&
            //  'X' is an obstacle, and you cannot travel through these cells.
            targetMap[r][c] != "X" &&
            // if not already visited
            !visited.contains([r, c])
          ) {
          visited.add([r, c]);
          // Main Logic steps + 1
          queue.add([r, c, steps + 1]);
        }
      }
    }

    return -1;
  }
}
