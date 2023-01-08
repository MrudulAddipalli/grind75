// Brute Force Approach
// Store Inorder Traversal Result
// Find Next Higher Element Of Given Node Value in the Stored Result
// Time - O(n) [ traversal ] + O(n) [ find ] -- O(n)
// Space - O(n) [ List ]

// Solution - https://www.youtube.com/watch?v=SXKAD2svfmI
// Time - O(H), H - height of tree
// Space - O(1)

import '../helper_data_structures.dart/binary_tree.dart';

class Solution {
  TreeNode? inorderSuccessor(TreeNode? root, TreeNode p) {
    TreeNode? successorNode;
    while (root != null) {
      // // updating node
      // if (root.val > p.val) {
      //   successorNode = root;
      // }

      // // updating pointers
      // if (p.val >= root.val) {
      //   root = root.right;
      // } else {
      //   root = root.left;
      // }

      // or 
      if (p.val >= root.val) {
        root = root.right;
      } else {
        successorNode = root;
        root = root.left;
      }
    }
    return successorNode;
  }
}
