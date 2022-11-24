import '../helper_data_structures.dart/binary_tree.dart';

// Solution - https://www.youtube.com/watch?v=ihj4IQGZ2zc

// Runtime: 396 ms, faster than 100.00% of Dart online submissions for Construct Binary Tree from Preorder and Inorder Traversal.
// Memory Usage: 230.2 MB, less than 37.50% of Dart online submissions for Construct Binary Tree from Preorder and Inorder Traversal.

class Solution {
  TreeNode? buildTree(List<int> preorder, List<int> inorder) {
    if(preorder.isEmpty || inorder.isEmpty) return null;

    TreeNode root = TreeNode(preorder[0]);
    int mid = inorder.indexOf(preorder[0]);
    root.left = this.buildTree(preorder.sublist(1,mid+1), inorder.sublist(0,mid));
    root.right = this.buildTree(preorder.sublist(mid+1), inorder.sublist(mid+1));
    return root;
  }
}