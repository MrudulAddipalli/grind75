import '../helper_data_structures.dart/binary_tree.dart';

// My Approach

// Time - 66% - O(n)
// Space - 66% - O(n)

class Solution {
  List<List<int>> pathSum(TreeNode? root, int targetSum) {
    List<List<int>> res = [];

    dfs(TreeNode node, List<int> path, int currentSum) {
      // leaf node found
      if (node.left == null && node.right == null && currentSum == targetSum) {
        print("Found Root, currentSum - $currentSum, path - $path");

        // Deep Copy
        res.add([...path]);
        // root != null is already added
        // storing root again
        path = [root!.val];
        print("Path Reset to - $path");
      }
      // left node traversal
      if (node.left != null) {
        final _sum = currentSum + node.left!.val;
        final _path = [...path, node.left!.val];
        print(
            "Traversing Left Node - ${node.left!.val}, currentSum - $_sum, path - $_path");
        dfs(node.left!, _path, _sum);
      }
      // right node traversal
      if (node.right != null) {
        final _sum = currentSum + node.right!.val;
        final _path = [...path, node.right!.val];
        print(
            "Traversing Right Node - ${node.right!.val}, currentSum - $_sum, path - $_path");
        dfs(node.right!, _path, _sum);
      }
    }

    if (root == null) return res;
    dfs(root, [root.val], root.val);
    return res;
  }
}
