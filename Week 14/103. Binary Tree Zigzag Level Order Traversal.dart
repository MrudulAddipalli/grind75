

// My Approach - Similar Solution - https://www.youtube.com/watch?v=UjCoPuDQlag

// Do BFS - Level Order Traversal
// add root to queue
// under while loop popLeft from queue and keep adding left and right of node to queue
// along with each iteration in while loop move nodes values to res array
// till queue is empty
// take res array and perfrom reverse on each even positions

import '../helper_data_structures.dart/binary_tree.dart';

// Time - O(n), n - nodes
// Space - O(n) , for queue, res is not counted in space complexity

// Time - 100%
// Space - 100%

class Solution {
  List<List<int>> zigzagLevelOrder(TreeNode? root) {
    List<List<int>> res = [];

    if (root == null) return res;

    List<TreeNode> queue = [];
    queue.add(root);

    int level = 0;

    while (queue.isNotEmpty) {
      int len = queue.length;
      List<int> row = [];
      level += 1;

      for (int i = 0; i < len; i++) {
        // removing node at each level
        TreeNode node = queue.removeAt(0);

        // storing level order result in row list
        row.add(node.val);

        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }

      // now current level nodes are ready

      if (level % 2 == 0) {
        res.add(row.reversed.toList());
      } else {
        // now reverse the list depending on level
        res.add(row);
      }
    }

    // now we can do reverse function on each evem position, but this will add extra iteration
    // so we will do reverse in while loop itself

    return res;
  }
}
