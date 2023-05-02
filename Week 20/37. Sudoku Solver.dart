// Solution - https://www.youtube.com/watch?v=FWAIf_EVUKE

class Solution {
  void solveSudoku(List<List<String>> board) {
    solveMatrix(board);
  }

  bool solveMatrix(List<List<String>> board) {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (board[i][j] == '.') {
          for (int c = 1; c <= 9; c++) {
            if (isSudokoValidIfWePlace_Char_At_I_J(board, i, j, c.toString())) {
              // placing char
              board[i][j] = c.toString();

              if (solveMatrix(board))
                return true;
              else
                // reverting character for placing other possible numbers
                board[i][j] = '.';
            }
          }

          return false;
        }
      }
    }
    // if all empty dots are placed with valid numbers
    return true;
  }

  bool isSudokoValidIfWePlace_Char_At_I_J(
      List<List<String>> board, int row, int col, String c) {
    for (int i = 0; i < 9; i++) {
      // check current column if entire Matrix has c repeated
      if (board[i][col] == c) return false;

      // check current row if entire Matrix has c repeated
      if (board[row][i] == c) return false;

      // check current 3x3 square if it has c repeated
      // this will check in current 3x3 matrix
      // IMP calculation
      if (board[3 * (row ~/ 3) + i ~/ 3][3 * (col ~/ 3) + i % 3] == c)
        return false;
    }
    return true;
  }
}
