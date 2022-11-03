// check if top or left or right or bottom is 0, meas found 1 island,
// if all are ones means it's not an island
// if it's land than mark current and all 4 directions as visited

class Solution {
  int numIslands(List<List<String>> grid) {
    int m = grid.length, n = grid[0].length;
    List<List<int>> visitedArea = [];
    int islands = 0;

    containsOrNot(List<int> visitingArea) {
      for (int i = 0; i < visitedArea.length; i++) {
        if (visitedArea[i][0] == visitingArea[0] &&
            visitedArea[i][1] == visitingArea[1]) {
          return true;
        }
      }
      return false;
    }

    markAsVisited(List<int> visitingArea) => visitedArea.add(visitingArea);

    for (int x = 0; x < m; x++) {
      for (int y = 0; y < n; y++) {
        final visitingArea = [x, y];

        bool isVisited = containsOrNot(visitingArea);

        if (grid[x][y] == "1") {
          if (isVisited) {
            print(
                "Current Area At - $visitingArea > ${grid[x][y]} Already Visited");
          } else {
            // check if top or left or right or bottom is 0, meas found 1 island,
            // if all are ones means it's not an island
            // if it's land than mark current and all 4 directions as visited
            String top = (x - 1) >= 0
                ? (!containsOrNot([x - 1, y]))
                    ? grid[x - 1][y]
                    : "-1"
                : "-1";
            String right = (y + 1) < n
                ? (!containsOrNot([x, y + 1]))
                    ? grid[x][y + 1]
                    : "-1"
                : "-1";
            String bottom = (x + 1) < m
                ? (!containsOrNot([x + 1, y]))
                    ? grid[x + 1][y]
                    : "-1"
                : "-1";
            String left = (y - 1) >= 0
                ? (!containsOrNot([x, y - 1]))
                    ? grid[x][y - 1]
                    : "-1"
                : "-1";

            print(
                "Current Area At - $visitingArea > ${grid[x][y]} -- top - $top, right - $right, bottom - $bottom, left - $left ");

            if (top == "0" || right == "0" || bottom == "0" || left == "0") {
              // island found
              islands++;
              print("island found\n\n");
            }

            // if it's land than mark current and all 4 directions as visited

            if (top == "1" || top == "0") markAsVisited([x - 1, y]);
            if (right == "1" || right == "0") markAsVisited([x, y + 1]);
            if (bottom == "1" || bottom == "0") markAsVisited([x + 1, y]);
            if (left == "1" || left == "0") markAsVisited([x, y - 1]);

            // mark current as visited
            markAsVisited([x, y]);
          }
        }
      }
    }

    return islands;
  }
}

void main() {
  print("Result - ${Solution().numIslands([
        ["1", "1", "1", "1", "0"],
        ["1", "1", "0", "1", "0"],
        ["1", "1", "0", "0", "0"],
        ["0", "0", "0", "0", "0"]
      ])}");
}
