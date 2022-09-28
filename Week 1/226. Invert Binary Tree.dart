class TreeNode {
    int val;
    TreeNode? left;
    TreeNode? right;
   TreeNode([this.val = 0, this.left, this.right]);
  }

class Solution1 {
  TreeNode? invertTree(TreeNode? root) {
      TreeNode? mainRoot = root;
    if(mainRoot != null){
       if(mainRoot.right != null && mainRoot.left !=null){
         TreeNode? rightNode =  invertTree(mainRoot.right); 
         TreeNode? leftNode =  invertTree(mainRoot.left); 
         if(rightNode!= null && leftNode!=null){
           int temp = rightNode.val;
           rightNode.val = leftNode.val;
           leftNode.val = temp;
         }
        }
    }
    return mainRoot;
  }
}

// here the problem with Solution1 is we are just swaping values of left and right node, 
// but the ref of left and right node is not updated
// due to which when parsing it maps to old node, 
// which may have not got swapped because of null child
class Solution2 {
  TreeNode? invertTree(TreeNode? root) {
    if (root != null) {
      invertTree(root.right);
      invertTree(root.left);
      TreeNode? temp = root.right;
      root.right = root.left;
      root.left = temp;
    }
    return root;
  }
}

void main(){
  TreeNode node = TreeNode(1);
  node.right = TreeNode(2);
  node.right!.right = TreeNode(4);
  node.right!.left = TreeNode(5);
  node.left = TreeNode(3);
  node.left!.right = TreeNode(6);
  node.left!.left = TreeNode(7);
  
  TreeNode? newNode =  Solution2().invertTree(node);
  print("newNode");
  print("Value ${newNode?.val}");
  print("Right ${newNode?.right?.val}");
  print("Right Right${newNode?.right?.right?.val}");
  print("Right Left${newNode?.right?.left?.val}");
  print("Left ${newNode?.left?.val}");
  print("Left Right${newNode?.left?.right?.val}");
  print("Left Left${newNode?.left?.left?.val}");
}