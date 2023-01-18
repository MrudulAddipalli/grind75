// Given the root of a binary tree and an integer targetSum, return the number of paths
// where the sum of the values along the path equals targetSum.
// The path does not need to start or end at the root or a leaf,
// but it must go downwards (i.e., traveling only from parent nodes to child nodes).

// Naive Brute Force Approach - Similar to Path Sum II
// where we used to find sum from root to leaf node
// and in between if we found any matching sum we used to store path array
// now in Path Sum III we have to start from each node and go to leaf and match sum of each iteration


import '../helper_data_structures.dart/binary_tree.dart';

// Time - O(n^2)
// Space - O(1)

class SolutionBruteForce {
  int pathSum(TreeNode? root, int targetSum) {
    int count = 0;

    void pathSum(TreeNode node, int currentSum) {
      currentSum+= node.val;
      if (currentSum == targetSum) count++;
      if (node.left != null) pathSum(node.left!, currentSum);
      if (node.right != null) pathSum(node.right!, currentSum);
    }

    void dfs(TreeNode? node) {
      if (node == null) return;
      pathSum(node, 0);
      dfs(node.left);
      dfs(node.right);
    }

    dfs(root);
    return count;
  }
}

// Optimisation - since we start from root and find all path sum, we may go to same path from it's child
// where left path will have sums.each => sums[i] - root.val,
// hence we need to store all sums from root
// This approach is called Prefix Sum

// Time - O(n) - 100%
// Space - O(n) - 100%

// Solution - https://www.youtube.com/watch?v=ofMqFAFVcKY

class SolutionPrefix {
  int pathSum(TreeNode? root, int targetSum) {
    int count = 0;
    Map<int, int> prefixSum = {};
    void dfs(TreeNode? node, int currentSum) {
      if (node == null) return;
      currentSum += node.val;
      if (currentSum == targetSum) count++;
      // check if prefix sum exists [currentSum - targetSum] or not
      count += prefixSum[currentSum - targetSum] ?? 0;
      // since we found the prefix Sum means sum - k exist, i.e for current sum +=node.val
      // we may have to use it further so update prefixSum cache with current sum
      // update cache - I
      prefixSum[currentSum] = (prefixSum[currentSum] ?? 0) + 1;
      dfs(node.left, currentSum);
      dfs(node.right, currentSum);
      // update cache - II
      prefixSum[currentSum] = (prefixSum[currentSum] ?? 0) - 1;
    }
    dfs(root, 0);
    return count;
  }
}
