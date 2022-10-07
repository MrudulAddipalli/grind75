import '../helper_data_structures.dart/treenode.dart';


// Runtime: 327 ms, faster than 100.00% of Dart online submissions for Diameter of Binary Tree.
// Memory Usage: 144.2 MB, less than 28.57% of Dart online submissions for Diameter of Binary Tree.

// https://www.youtube.com/watch?v=bkxqA8Rfv04

class Solution {
  int biggestDiameter = 0;
  int diameterOfBinaryTree(TreeNode? root) {
    if (root == null) return 0;
    findHeight(root);
    return biggestDiameter;
  }

//  () -- height
//  [] -- diameter -- where heights are added because we return maxHeight + 1
//   * -- global diameter variable updated
//                                                       1(1+Max(2,0)==3)[2+0+2 = 4]*
//              2 (1+Max(-1,-1)==0)[-1+-1+2=0]                                                   3 (1+Max(1,0)==2)[1+0+2 = 3]*
//                                                          4 (1+Max(-1,-1)==0)[-1+-1+2=0]                                  5 (1+Max(0,0)==1)[0+0+2 = 2]*
//                                                                                     6 (1+Max(-1,-1)==0)[-1+-1+2=0]                   7 (1+Max(-1,-1)==0)[-1+-1+2=0]

  int findHeight(TreeNode? root) {
    if (root == null) return -1;
    int rightHeight = findHeight(root.right);
    int leftHeight = findHeight(root.left);
    // +2 for edge node with no childs (-1) + (-1) + 2 = 0
    int tempDiameter = rightHeight + leftHeight + 2;
    if (biggestDiameter < tempDiameter) {
      biggestDiameter = tempDiameter;
    }
    // for any parent node only max height matterns because path is one directional from any node
    int maxHeight = rightHeight > leftHeight ? rightHeight : leftHeight;
    return 1 + maxHeight;
  }

  void printTree(TreeNode? root) {
    if (root != null) {
      print(root.val);
      printTree(root.right);
      printTree(root.left);
    }
  }
}

void main() {
  Solution sol = Solution();
  TreeNode root = TreeNode(1);
  root.right = TreeNode(3);
  root.left = TreeNode(2);
  root.right!.right = TreeNode(5);
  root.right!.left = TreeNode(4);
  root.right!.right!.right = TreeNode(7);
  root.right!.right!.left = TreeNode(6);
  sol.printTree(root);

//                         1
//              2                  3
//                           4           5
//                                  6         7

  print(Solution().diameterOfBinaryTree(root));
}
