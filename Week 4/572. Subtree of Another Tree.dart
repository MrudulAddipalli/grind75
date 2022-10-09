import '../helper_data_structures.dart/binary_tree.dart';

// Solution - https://www.youtube.com/watch?v=E36O5SWp-LE

// Runtime: 588 ms, faster than 40.00% of Dart online submissions for Subtree of Another Tree.
// Memory Usage: 146 MB, less than 20.00% of Dart online submissions for Subtree of Another Tree.

class Solution {
  bool isSubtree(TreeNode? root, TreeNode? subRoot) {
    // handling 2 base cases
    if(subRoot == null) return true; // since subRoot is null means every leaf node will of Root tree will return true, hence not checking and directly returing true
    if(root == null) return false; // no subtree can be found in root tree

    // main entry point
    if (isIdentitical(root, subRoot)) return true;
    // if tree not matching from root node, then search for left and right of root tree and call isSubtree again to repeat logic
    // main logic - checking for every node of a root tree with subTree
    return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot);
  }

  bool isIdentitical(TreeNode? root, TreeNode? subRoot) {
    if (root == null && subRoot == null) return true;
    if (root != null && subRoot != null && root.val == subRoot.val) {
      return (isIdentitical(root.left, subRoot.left) &&
          isIdentitical(root.right, subRoot.right));
    }
    return false;
  }
}
