

import '../helper_data_structures.dart/binary_tree.dart';

// https://www.youtube.com/watch?v=0K0uCMYq5ng
// Time Complexity - O(n) - 1 loop over nums array
//  Space Complexity - O(logn) - height of tree, where we create TreeNode 


class Solution {
  TreeNode? sortedArrayToBST(List<int> nums) {

    // inner inline helper function
    TreeNode? mid(int l, int r) {
      if (l > r) return null;

      int m = (l + r) ~/ 2;
      // adding node

      // we are returing node from bottom to top approach
      // in last return node, means last recursive call returns node with TreeNode(num[m]) to parent call
      // and parent will assign the returned node to left or right
      // and return parent node to main Solution function
      // last recursive call will return required node
      TreeNode? node = TreeNode(nums[m]);
      node.left = mid(l, m - 1);
      node.right = mid(m + 1, r);

      return node;
    }

    return mid(0, nums.length - 1);
  }
}

void main() {
  print("${Solution().sortedArrayToBST([-10, -3, 0, 5, 9])}");
}
