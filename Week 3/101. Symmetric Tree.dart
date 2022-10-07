import '../helper_data_structures.dart/treenode.dart';

class Solution {
  bool isSymmetric(TreeNode? root) {
      if(root == null) return true;
      return isMirror(root.left,root.right);    
  }
  
  bool isMirror(TreeNode? left,TreeNode? right){
    if (left == null && right == null) return true;
    if(left !=null && right!=null) {
      // main logic - center should be equal
      return 
        // main logic - center should be equal
        (left.val == right.val) && 
        // left should be mirror of right
        isMirror(left.left,right.right) && 
        // right should be mirror of left
        isMirror(left.right, right.left); 
    };
    return false;
  }
}