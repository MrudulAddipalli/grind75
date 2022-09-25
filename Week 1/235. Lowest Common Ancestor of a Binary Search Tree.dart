class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.val);
}

// C++

// class Solution {
// public:
//     TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
//       TreeNode* current = root;
//       while(current){
//         if(p->val > current->val && q->val > current->val){
//           current = current->right;
//         }else if(p->val < current->val && q->val < current->val){
//           current = current->left;
//         }else{
//           return current;
//         }
//       }
//       return root;
//     }
// };


// Explaination - https://www.youtube.com/watch?v=gs2LMfuOR9k

class Solution {
  TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    TreeNode? current = root;
    while (current != null) {
      if (p.val > current.val && q.val > current.val) {
        current = current.right;
      } else if (p.val < current.val && q.val < current.val) {
        current = current.left;
      } else {
        // means both nodes are in different direction hence current becomes the common root for both the nodes,
        // hence returning current which points as root of the both the nodes
        return current;
      }
    }
    return root;
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
  TreeNode root = TreeNode(10);
  root.right = TreeNode(15);
  root.left = TreeNode(4);
  root.right!.right = TreeNode(26);
  root.right!.left = TreeNode(24);
  root.left!.right = TreeNode(6);
  root.left!.left = TreeNode(3);
  sol.printTree(root);
  // in Binary Search Tree, Right Node is Larger than root, and left is smaller than root
//                     10
//              4             15
//          3       6     24      26

  TreeNode lca = sol.lowestCommonAncestor(root, TreeNode(24), TreeNode(26));
  // lca should be 15
  print("lca is ");
  sol.printTree(lca);
}
