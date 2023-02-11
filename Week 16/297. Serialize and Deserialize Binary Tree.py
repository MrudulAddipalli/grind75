

#  Solution - https://www.youtube.com/watch?v=u4JAi2JJhI8

# Time - O(n) 
# Space - O(n) 
#  n - no. of nodes

# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

class Codec:

    def serialize(self, root):
        res = []

        def dfs(node):
            if not node:
                res.append("N")
                return
            res.append(str(node.val))
            dfs(node.left)
            dfs(node.right)
        
        dfs(root)
        return ",".join(res)
        

    def deserialize(self, data):
        nodes = data.split(",")
        # index for array traversal
        self.i =0

        def dfs():
            if nodes[self.i] == "N":
                self.i += 1
                return None

            node = TreeNode(int(nodes[self.i]))
            self.i += 1
            node.left = dfs()
            node.right = dfs()
            return node

        return dfs()

