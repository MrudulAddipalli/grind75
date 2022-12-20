
# Solution - https://www.youtube.com/watch?v=TjFXEUCMqI8

# Time - O(9*9) - for 9x9 matrix traversal
# Space - O(9*9) - for maps

from ast import List
import collections

class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        cols = collections.defaultdict(set)
        rows = collections.defaultdict(set)
        squares = collections.defaultdict(set)  # Key = (r/3 , c/3)

        for r in range(9):
            for c in range(9):
                if board[r][c] == ".":
                    continue
                if (board[r][c] in rows[r] or
                    board[r][c] in cols[c] or
                        board[r][c] in squares[(r//3, c//3)]):
                    # means number already exists and doesnot satisfy rules of suduko
                    return False
                # update maps
                rows[r].add(board[r][c])
                cols[c].add(board[r][c])
                squares[(r//3, c//3)].add(board[r][c])
        return True


# Solution In Dart

# class Solution {
#   bool isValidSudoku(List<List<String>> board) {
#     Map<int, Set<String>> cols = {};
#     Map<int, Set<String>> rows = {};
#     Map<Pair<int, int>, Set<String>> squares = {};
#     for (int r = 0; r < 9; r++) {
#       for (int c = 0; c < 9; c++) {
#         if (board[r][c] == ".") continue;
#         Pair pair = Pair(r ~/ 3, c ~/ 3);
#         if ((rows[r] != null && rows[r]!.contains(board[r][c])) ||
#             (cols[c] != null && cols[c]!.contains(board[r][c])) ||
#             (squares[pair] != null &&
#                 squares[pair]!.contains(board[r][c]))) {
#           # means number already exists and doesnot satisfy rules of suduko
#           return false;
#         }
#         # update maps
#         rows[r]?.add(board[r][c]);
#         cols[c]?.add(board[r][c]);
#         squares[pair]?.add(board[r][c]);
#       }
#     }

#     return true;
#   }
# }

# class Pair<T1, T2> {
#   final T1 a;
#   final T2 b;

#   Pair(this.a, this.b);
# }
