# Time - O(n)
# Space - O(1)
# 
# Solution - https://www.youtube.com/watch?v=s6ATEkipzow
# 
# Runtime: 54 ms, faster than 84.58% of Python3 online submissions for Validate Binary Search Tree.
# Memory Usage: 16.5 MB, less than 80.15 % of Python3 online submissions for Validate Binary Search Tree.


class Solution:
    def isValidBST(self, root: Optional[TreeNode]) -> bool:
        def isValid(node, left, right):
            if not node:
                return True
            if not (node.val < right and node.val > left):
                return False
            return isValid(node.left, left, node.val) and isValid(node.right, node.val, right)

        return isValid(root, float("-inf"), float("inf"))

# Same Solution Not Working In Dart

# import '../helper_data_structures.dart/binary_tree.dart';
# class Solution {
#   bool isValidBST(TreeNode? root) {
#     isValid(TreeNode? node, int left, int right) {
#       if (node == null) return true;
#       if (!(node.val < right && node.val > left)) return false;
#       return isValid(node.left, left, node.val) &&
#           isValid(node.right, node.val, right);
#     }

#     return isValid(root, 2147483649, 2147483649);
#   }
# }


# Naive Solution
# // // not working for - [5,1,4,null,null,3,6]
# because when we add 3, it should be child of left node of root [5], 5 left node
# will be 1 and 3 will right node of 1, but in the given array,
# 3 is node of 4 which is right node of root [5]


# // class Solution {
# //   bool isValidBST(TreeNode? root) {
# //     return isValid(root);
# //   }

# //   bool isValid(TreeNode? root) {
# //     if (root == null) return true;

# //     if (root.left == null && root.right == null) return true;

# //     if ((root.left != null && root.left!.val < root.val) ||
# //         (root.right != null && root.right!.val > root.val))
# //       return isValid(root.left) && isValid(root.right);

# //     return false;
# //   }
# // }
