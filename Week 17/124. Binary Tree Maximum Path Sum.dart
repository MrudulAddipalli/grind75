// Solution - https://www.youtube.com/watch?v=Hr5cWUld4vU

import '../helper_data_structures.dart/binary_tree.dart';

class Solution {
  int maxPathSum(TreeNode? root) {
    if (root == null) return 0;

    int maxSum = root.val;

    // returns path max sum without split
    int dfs(TreeNode? node) {
      if (node == null) return 0;

      int leftMax = dfs(node.left);
      int rightMax = dfs(node.right);

      // above values can be negative which adds lots of logic to make disicion for choosing max value
      // hence it it zero
      leftMax = max(leftMax, 0);
      rightMax = max(rightMax, 0);

      // update maxSum
      maxSum = max(maxSum, node.val + leftMax + rightMax);

      // return path max sum without split
      return node.val + max(leftMax, rightMax);
    }

    dfs(root);
    return maxSum;
  }

  int max(int a, int b) => a > b ? a : b;
}
