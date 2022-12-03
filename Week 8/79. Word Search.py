
# Time - O(M x N x 4^n), n == lenght of word
# Space - O(M x N x 4^n)

# Solution - https://www.youtube.com/watch?v=pfiQ_PS1g8E

from ast import List

class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:

        ROWS, COLS = len(board), len(board[0])
        path = set()

        def dfs(r, c, i):
            # we not checking word equality here cause we have a condition { word[i] != board[r][c] } for each char
            # hence if each character does not match dfs will not reach here
            if i == len(word):
                return True
            if (r < 0 or c < 0 or r >= ROWS or c >= COLS or word[i] != board[r][c]
             or (r, c) in path):
                return False
            path.add((r, c))
            res = (dfs(r+1, c, i+1) or (r-1, c, i+1) or dfs(r, c+1, i+1) or dfs(r, c-1, i+1)) 
            path.remove((r, c))
            return res

        for r in range(ROWS):
            for c in range(COLS):
                if dfs(r, c, 0):
                    return True

        return False
