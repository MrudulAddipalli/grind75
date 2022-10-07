class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? sortedArrayToBST(List<int> nums) {
    TreeNode? root;
    for (int i = 0; i < nums.length; i++) {
      root = recursiveInsert(root, nums[i]);
    }
    printIt(root);
    return root;
  }

  // https://www.techiedelight.com/insertion-in-bst/
  TreeNode? recursiveInsert(TreeNode? root, int val) {
    if (root == null) {
      print("Adding $val");
      return TreeNode(val);
    }

    if (val >= root.val) {
      root.right = recursiveInsert(root.right, val);
    } else {
      root.left = recursiveInsert(root.left, val);
    }

    // updated root node after recursion complete
    return root;
  }

  // https://www.techiedelight.com/insertion-in-bst/
  TreeNode? iterativeInsert(TreeNode? root, int val) {
    if (root == null) {
      print("Adding $val");
      return TreeNode(val);
    }
    TreeNode? curr = root;
    TreeNode? temp = root;
    while (curr != null) {
      // updating temp till curr is not null,
      // after while curr wll be pointing to null node
      // hence saving last non null node in temp
      temp = curr;
      if (val >= curr.val) {
        curr = curr.right;
      } else {
        curr = curr.left;
      }
    }

    if (val >= temp!.val) {
      print("Adding $val");
      temp.right = TreeNode(val);
    } else {
      print("Adding $val");
      temp.left = TreeNode(val);
    }

    // egde case
    return root;
  }

  // InOrder Traversal
  void printIt(TreeNode? root) {
    if (root == null) return;
    printIt(root.left);
    print("${root.val}");
    printIt(root.right);
    print("\n");
  }
}

void main() {
  print("${Solution().sortedArrayToBST([0, 5, 9])}");
}
