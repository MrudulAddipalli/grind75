import '../helper_data_structures.dart/binary_tree.dart';

// Solution - https://www.youtube.com/watch?v=d4zLyf32e3I

// check - 102. Binary Tree Level Order Traversal.dart

// Runtime: 299 ms, faster than 100.00% of Dart online submissions for Binary Tree Right Side View.
// Memory Usage: 156.5 MB, less than 25.00% of Dart online submissions for Binary Tree Right Side View.

// Time - O(n)
// Space - O(n)

class Solution {
  List<int> rightSideView(TreeNode? root) {
    List<int> res = [];
    if (root == null) return res;
    List<TreeNode> queue = [];
    queue.add(root);
    // BFS approach
    while (queue.isNotEmpty) {
      List<int> childrens = [];
      // not using direct queue.lenght in for loop because we are
      // updating queue while for loop is in progress
      int noOfNodesInQueueAsPerCurrentLevel = queue.length;

      for (int childs = 0;
          childs < noOfNodesInQueueAsPerCurrentLevel;
          childs++) {
        TreeNode currentNode = queue.removeAt(0);
        childrens.add(currentNode.val);
        // also add left and child nodes in queue for BFS
        if (currentNode.left != null) queue.add(currentNode.left!);
        if (currentNode.right != null) queue.add(currentNode.right!);
      }

      // right hand side has more priority
      // since we are returning right side view
      res.add(childrens.last);
    }
    return res;
  }
}

// Sol 2 & 3 not working

// not working for [1,2,3,4]
// Out - [1,3]
// exp - [1,3,4]
class Solution2 {
  List<int> rightSideView(TreeNode? root) {
    List<int> res = [];
    if (root == null) return res;
    res.add(root.val);
    TreeNode? curr;

    if (root.right == null && root.left != null) {
      curr = root.left;
    } else {
      curr = root.right;
    }

    while (curr != null) {
      res.add(curr.val);

      // if there is only root and left node
      // then only considering right will be wrong

      if (curr.right == null && curr.left != null) {
        curr = curr.left;
      } else {
        curr = curr.right;
      }
    }
    return res;
  }
}

// not working for [1,2]
// Out - [1]
// exp - [1,2]
class Solution3 {
  List<int> rightSideView(TreeNode? root) {
    List<int> res = [];
    if (root == null) return res;
    res.add(root.val);
    TreeNode? curr = root.right;
    while (curr != null) {
      res.add(curr.val);
      curr = curr.right;
    }
    return res;
  }
}
