class Solution {
  int majorityElement(List<int> nums) {
    if (nums.isEmpty) return -1;
    Map<int, int> counts = {};
    for (int i = 0; i < nums.length; i++) {
      counts[nums[i]] = (counts[nums[i]] ?? 0) + 1;
    }
    int max = 0, digit = nums[0];
    counts.forEach((key, count) {
      if (count > max) {
        max = count;
        digit = key;
      }
      print("Key - $key, Count - $count, max - $max, digit - $digit");
    });

    return digit;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.majorityElement([2, 2, 1, 1, 1, 2, 2]));
}
