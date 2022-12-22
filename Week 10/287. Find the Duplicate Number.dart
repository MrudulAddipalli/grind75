// Solution - https://www.youtube.com/watch?v=wjYnzkAhcNk

// Approach 1 --- O(n) - Use HashMap and store value as count of repetation, if key already exist means repeated number found
// this Approach fails for given constraints - solve the problem without modifying the array nums.

// Approach 2 --- O(nLogn) - sort the array, traverse and find if nums[i] == nums[i+1] , return nums[i] 
// this Approach fails for given constraints - only use consta

// Floyd's Cycle Detection Algo
class Solution {
  int findDuplicate(List<int> nums) {
    int slow = 0, fast = 0;
    while (true){
      slow = nums[slow];
      fast = nums[nums[fast]];
      if(slow == fast) break;
    }
    int slow2 = 0;
    while (true){
      slow = nums[slow];
      slow2 = nums[slow2];
      if(slow == slow2) break;
    }
    return slow;
  }
}