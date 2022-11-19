// Solution - https://www.youtube.com/watch?v=IsvocB5BJhw

// Time - O(2^n)
// Space - O(2^n)

// Runtime: 843 ms, faster than 20.00% of Dart online submissions for Partition Equal Subset Sum.
// Memory Usage: 174.2 MB, less than 60.00% of Dart online submissions for Partition Equal Subset Sum.

class Solution {
  bool canPartition(List<int> nums) {
    int sum = nums.reduce((a, b) => a + b);
    if (sum % 2 == 1) return false;

    Set<int> dp = {};
    dp.add(0);

    // Main Catch
    int target = sum ~/ 2;

    for (int number in nums) {
      Set<int> tempdp = {};
      for (int currentSum in dp) {
        // Optimisation
        if (number + currentSum == target) return true;

        // since we are iterating on same dp set
        // so modifying dp in inner for loop will throw error
        // dp.add(number+currentSum); // not using instead using tempdp
        // Concurrent modification during iteration: Instance of '_LinkedHashSet<int>'.

        tempdp.add(number + currentSum);
        // set will not store repeated numbers
        tempdp.add(currentSum);
      }
      dp = tempdp;
    }

    return dp.contains(target) ? true : false;
  }
}


void main() {
  print('Result - ${Solution().canPartition([1,5,11,5])}');
}