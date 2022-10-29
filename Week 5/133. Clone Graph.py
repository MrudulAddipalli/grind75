# Solution - https://www.youtube.com/watch?v=mQeF6bN8hMk

class Node:
    def __init__(self, val=0, neighbors=None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []


class Solution:
    def cloneGraph(self, node: Node) -> Node:
        # this stores the new copy of nodes
        oldToNewMap = {}

        def dfs(node: Node):
            # node was already created hence returning new cloned instance
            if node in oldToNewMap:
                return oldToNewMap[node]

            # creating new clone
            clone = Node(node.val)

            # storing clone, which helps in returning
            # clone instance for looping neighbors
            oldToNewMap[node] = clone

            # iterate all neighbors of curretn node,
            # which will iteratively appends neightbouring nodes to clone node
            # and create new clone of node if does not exist
            for adjecentNode in node.neighbors:
                clone.neighbors.append(dfs(adjecentNode))

            return clone

        # null check for node
        return dfs(node) if node else None
