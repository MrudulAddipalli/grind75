// Solution - https://www.youtube.com/watch?v=GBKI9VSKdGg&t=467s

// Runtime: 335 ms, faster than 100.00% of Dart online submissions for Combination Sum.
// Memory Usage: 158.4 MB, less than 25.00% of Dart online submissions for Combination Sum.

// Time - O(2^t) ,  t is target value
// Space - O(n) - cannot determine

// [2,3,6,7], target = 7
class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    List<List<int>> res = [];
    dfs(int i, List<int> currCombinations, int currentSum) {
      if (currentSum == target) {
        res.add([...currCombinations]);
        return;
      }

      if (i >= candidates.length || currentSum > target) {
        return;
      }

      // [ 2, 2, 2, 2]
      currCombinations.add(candidates[i]);
      dfs(i, currCombinations, currentSum + candidates[i]);
      // since 2 + 2 + 2 + 2 == 8 which > target 7
      // hence pop
      // [ 2, 2, 2]
      if (currCombinations.length > 0) currCombinations.removeLast();
      // i++ --> i = 2;
      // in next dfs we will have
      // [ 2, 2, 2, 3], and so on [ 2, 2, 2, 6], [ 2, 2, 2, 7]
      // these 2 --- [ 2, 2, 2, 6], [ 2, 2, 2, 7] will get returned immediatly since currentSum will not satisfy the condition
      // hence again pop
      // [ 2, 2 ]
      // in next dfs we will have [ 2, 2, 3], [ 2, 2, 6] and so on
      dfs(i + 1, currCombinations, currentSum);
    }

    dfs(0, [], 0);
    return res;
  }
}
