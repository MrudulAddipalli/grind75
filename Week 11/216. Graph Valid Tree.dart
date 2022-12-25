// Solution - https://www.youtube.com/watch?v=bXsUuownnoQ&t=214s

// Time & Space - O(NxV), 
// N - nodes , V - Vertices

class Solution {
  bool validTree(int n, List<List<int>> edges) {

    // base case - if nop nodes means it is a valid tree
    if (n <= 0) return true;

    Map<int, List<int>> adjacencyNodes = {};

    // Mapping All Nodes with It's Adjacent Nodes
    for (int i = 0; i < edges.length; i++) {
      final node = edges[i][0];
      final adjacentNode = edges[i][1];
      if (adjacencyNodes[node] == null) {
        adjacencyNodes[node] = [adjacentNode];
      } else {
        adjacencyNodes[node]!.add(adjacentNode);
      }
      if (adjacencyNodes[adjacentNode] == null) {
        adjacencyNodes[adjacentNode] = [node];
      } else {
        adjacencyNodes[adjacentNode]!.add(node);
      }
    }

    Set<int> visited = {};
    dfs(int currentNode, int previousNode) {
      if (visited.contains(currentNode)) return false;
      visited.add(currentNode);
      for (int allAdjacentNode in adjacencyNodes[currentNode]!) {
        if (allAdjacentNode == previousNode) continue;
        if (dfs(allAdjacentNode, currentNode) == false) return false;
      }
      return true;
    }

    // nodes will start from 0 to n-1
    // if we don;t have any connected nodes then our visited set will not have that node added
    // and we cannot justify if tree is valid or not without finding if loop exist
    return dfs(0, -1) && visited.length == n;
  }
}
