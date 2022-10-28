
// Solution - https://www.youtube.com/watch?v=XZnWETlZZ14
// Solution - https://www.youtube.com/watch?v=6ZnyEApgFYg

// Runtime: 471 ms, faster than 78.79% of Dart online submissions for Binary Tree Level Order Traversal.
// Memory Usage: 142.4 MB, less than 93.94% of Dart online submissions for Binary Tree Level Order Traversal.

import '../helper_data_structures.dart/binary_tree.dart';

class Solution {
  List<List<int>> levelOrder(TreeNode? root) {
    List<List<int>> res = [];
    if (root == null) return res;

    // BFS Approach,
    // DFS has in pre and post orders
    List<TreeNode> queue = [];

    // adding root as node for first level
    queue.add(root);

    while (queue.isNotEmpty) {
      // this will give no. of nodes present in current level
      int noOfNodesInQueueAsPerCurrentLevel = queue.length;

      List<int> nodesInCurrentLevel = [];

      for (int i = 0; i < noOfNodesInQueueAsPerCurrentLevel; i++) {
        
        // queue is FIFO, so we need to remove first element 
        TreeNode currentNode = queue.removeAt(0);
        nodesInCurrentLevel.add(currentNode.val);

        // adding next level nodes of currentNode
        if (currentNode.left != null) queue.add(currentNode.left!);
        if (currentNode.right != null) queue.add(currentNode.right!);
      }

      // adding current level nodes to result array
      res.add(nodesInCurrentLevel);
    }

    return res;
  }
}
