import '../helper_data_structures.dart/binary_tree.dart';

// Solution - https://www.youtube.com/watch?v=5LUXSvjmGCw&t=188s

// better iterative approach
class Solution {
  int kthSmallest(TreeNode? root, int k) {
    int count = 0;
    List<TreeNode> stack = [];
    TreeNode? curr = root;
    // inOrder Traversal in Iterative Approach
    while (curr != null || stack.isNotEmpty) {
      // traversing left
      while (curr != null) {
        stack.add(curr);
        curr = curr.left;
      }
      // removing left node as for inorder traversal we first traverse left then root thrn right
      curr = stack.removeLast();
      // since we got the first element of our inOrder traversal
      // update count
      count++;
      // Main Logic
      if (count == k) {
        return curr.val;
      }
      // now going to right node
      curr = curr.right;
    }
    // code will never reach here, since nodes and k will equal or nodes will be more, so code will get returned from inside while loop
    return -1;
  }
}

// This is a recursive approach where each node is traversed and we return value from array
class Solution2 {
  List<int> data = [];
  int kthSmallest(TreeNode? root, int k) {
    return inOrderTraversal(root, k);
  }

  int inOrderTraversal(TreeNode? root, int k) {
    if (root == null) return 0;
    if (root.left != null) inOrderTraversal(root.left, k);
    print("Traversing - ${root.val}");
    data.add(root.val);
    if (root.right != null) inOrderTraversal(root.right, k);
    return data[k - 1];
  }
}

void main() {
  // [3,1,4,null,2]
  TreeNode node = TreeNode(3);
  node.left = TreeNode(1);
  node.left!.right = TreeNode(2);
  node.right = TreeNode(4);
  print("Result - ${Solution().kthSmallest(node, 1)}");
//   print("Result - ${Solution().findAnagrams("abab","ab")}");
}
