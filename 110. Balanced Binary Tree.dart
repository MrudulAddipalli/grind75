class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.val);
}

class Solution {
  bool isBalanced(TreeNode? root) {
    if (root == null) return false;
    return isBalanced2(root) > 0;
  }

  // https://www.geeksforgeeks.org/how-to-determine-if-a-binary-tree-is-balanced/#
  int isBalanced2(TreeNode? root) {
    if (root == null) return 0;
    int lh = isBalanced2(root.left);
    if (lh == -1) return -1;
    int rh = isBalanced2(root.right);
    if (rh == -1) return -1;

    int diff = 0, max = 0;
    // Math.abs and Mat.max
    if (lh - rh < 0) {
      diff = rh - lh;
      max = rh;
    } else {
      diff = lh - rh;
      max = lh;
    }
    // this is the breakpoint for this logic
    if (diff > 1)
      return -1;
    else
      return max + 1;
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

  print("isBalanced ${sol.isBalanced(root)}"); // false
}
