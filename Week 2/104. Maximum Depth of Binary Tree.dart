class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.val);
}


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