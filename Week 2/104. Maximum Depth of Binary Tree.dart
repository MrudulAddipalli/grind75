import '../helper_data_structures.dart/binary_tree.dart';

class Solution {
  int maxDepth(TreeNode? root) {
    return dfs(root);
  }
  int dfs(TreeNode? root){
    if(root == null) return 0;
    int lh = dfs(root.left);
    int rh = dfs(root.right);
    int max = lh > rh ? lh : rh;
    return 1 + max; 
  }
}