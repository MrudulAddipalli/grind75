
# Solution - https://www.youtube.com/watch?v=Ph95IHmRp5M

from ast import List

class Solution:
    def solveNQueens(self, n: int) -> List[List[str]]:
        colSet = set()  # column
        posDiag = set()  # (r + c)
        negDiag = set()  # (r - c)

        res = []

        # used [ [] [] ], multiple array for row, only because of accesing cell as [r][c]
        # else we need board[r].charAt(c)
        board = [["."] * n for i in range(n)]

        def backtrack(row: int):

            # reached last row
            if (row == n):
                # we have found chess board which is valid
                # formatting [ ["."]["."]["."]["Q"] ] => [ "...Q" ]
                copy = ["".join(row) for row in board]
                res.append(copy)
                return

            # need to check for all column
            # [r][0], [r][1] ....
            for col in range(n):
                if col in colSet or (row+col) in posDiag or (row-col) in negDiag:
                    # new queen cannot be add at current [row][col]
                    continue

                colSet.add(col)
                posDiag.add(row+col)
                negDiag.add(row-col)
                # placing queen in board
                board[row][col] = "Q"

                backtrack(row+1)

                # reset for backtracking
                colSet.remove(col)
                posDiag.remove(row+col)
                negDiag.remove(row-col)
                # reset queen in board
                board[row][col] = "."

        # start with 0th index
        backtrack(0)
        return res
