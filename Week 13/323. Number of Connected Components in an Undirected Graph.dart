// For Union Find Solution - https://www.youtube.com/watch?v=8f1XPm4WOUc&t=695s

// Solution - https://leetcode.ca/2016-10-18-323-Number-of-Connected-Components-in-an-Undirected-Graph/
// DFS - Approach

class Solution {
  int countComponents(int n, List<List<int>> edges) {
    int res = 0;
    List<bool> isVisited = List.filled(n, false);

    // create adjacency list for each node
    Map<int, List<int>> adjacencyNodes = {};

    for (int i = 0; i < edges.length; i++) {
      int node1 = edges[i][0];
      int node2 = edges[i][1];
      if (adjacencyNodes[node1] == null) adjacencyNodes[node1] = [];
      adjacencyNodes[node1]!.add(node2);
      if (adjacencyNodes[node2] == null) adjacencyNodes[node2] = [];
      adjacencyNodes[node2]!.add(node1);
    }

    void dfs(int node) {
      if (isVisited[node] == true) return;

      // mark as visited
      isVisited[node] = true;

      // mark all connected nodes of current $node as visited
      for (int neighbour in adjacencyNodes[node]!) {
        dfs(neighbour);
      }
    }

    // find if any node is getting disconnected means we have unconnected components
    // hence we will return connected components count

    // Given n nodes labeled from 0 to n - 1
    for (int i = 0; i < n; i++) {
      if (!isVisited[i]) {
        res += 1;
        dfs(i);
      }
    }

    return res;
  }
}
