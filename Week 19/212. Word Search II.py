
# Solution - https://www.youtube.com/watch?v=asbcE9mZz_U

from ast import List

class TreiNode:
    def __init__(self) -> None:
        self.children = {}
        self.isWord = False

    def addWord(self, word):
        cur = self
        for c in word:
            if (c not in cur.children):
                cur.children[c] = TreiNode()
            cur = cur.children[c]
        cur.isWord = True


class Solution:
    def findWords(self, board: List[List[str]], words: List[str]) -> List[str]:
        root = TreiNode()

        # addinf each words in TrieNode
        for word in words:
            root.addWord(word)

        ROW = len(board)
        COL = len(board[0])
        res = set()
        visited = set()

        def dfs(r: int, c: int, node: TreiNode, word: str):
            if r < 0 or r == ROW or c < 0 or c == COL or (r, c) in visited or board[r][c] not in node.children:
                return

            visited.add((r, c))

            # since we already checked whether currentWord does not contain in node.children break function
            # if current node contains currentWord then we can find next character of remaining string of the word
            currentWord = board[r][c]
            # hence updating node
            node = node.children[currentWord]
            word += currentWord

            # is newly formed word is a word which exists in words list
            # add it to res
            if node.isWord:
                res.add(word)

            # move in all directions
            dfs(r+1, c, node, word)
            dfs(r-1, c, node, word)
            dfs(r, c+1, node, word)
            dfs(r, c-1, node, word)

            # since we are doing back tracking we need remove from visited
            # for next work traversal
            visited.remove((r, c))

        for r in range(ROW):
            for c in range(COL):
                dfs(r, c, root, "")

        # converting set to list, as required
        # set is used to avoid duplicate results in
        return list(res)
