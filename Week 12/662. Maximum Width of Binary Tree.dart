// Solution - https://www.youtube.com/watch?v=sm4UdCO2868

// Time - 100%
// Space - 100%

import '../helper_data_structures.dart/binary_tree.dart';

class Solution {
  int widthOfBinaryTree(TreeNode? root) {
    int max_width = 0;
    Map<int, int> leftmost_positions = {};
    getWidth(TreeNode? root, int depth, int position) {
      if (root == null) return;
      // for right node, depth will always be present hence we only track left most positions
      if (!leftmost_positions.containsKey(depth)) {
        leftmost_positions[depth] = position;
      }
      max_width = max(max_width, position - leftmost_positions[depth]! + 1);
      getWidth(root.left, depth + 1, position * 2);
      getWidth(root.right, depth + 1, position * 2 + 1);
    }
    getWidth(root, 0, 0);
    return max_width;
  }
  int max(int a, int b) => a > b ? a : b;
}
