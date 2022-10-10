import '../helper_data_structures.dart/binary_tree.dart';

class Solution {
  bool isSymmetric(TreeNode? root) {
    if (root == null) return true;
    return isMirror(root.left, root.right);
  }

  bool isMirror(TreeNode? left, TreeNode? right) {
    if (left == null && right == null) return true;
    if (left == null || right == null) return false;

    // main logic - center should be equal
    return (left.val == right.val) &&
        // left should be mirror of right
        isMirror(left.left, right.right) &&
        // right should be mirror of left
        isMirror(left.right, right.left);
  }
}
