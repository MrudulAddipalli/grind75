

// Runtime: 293 ms, faster than 100.00% of Dart online submissions for Same Tree.
// Memory Usage: 142.1 MB, less than 96.55% of Dart online submissions for Same Tree.

// Solution - https://www.youtube.com/watch?v=vRbbcKXCxOw

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isSameTree(TreeNode? p, TreeNode? q) {
    // breakpoint one - learnt from solution video 
    if (p == null && q == null) return true;
    // breakpoint two - learnt from solution video 
    if (p == null || q == null) return false;
    if (p.val == q.val &&
        (isSameTree(p.right, q.right) && isSameTree(p.left, q.left))) {
      return true;
    } else {
      return false;
    }
  }
}
