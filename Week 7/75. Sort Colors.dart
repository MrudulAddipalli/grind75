// Time - O(n)
// Space - O(1)

// Runtime: 214 ms, faster than 100.00% of Dart online submissions for Sort Colors.
// Memory Usage: 142.9 MB, less than 18.75% of Dart online submissions for Sort Colors.

// For O(log N) 
// Solution - https://www.youtube.com/watch?v=HuS-ZsnEdbc

class Solution {
  void sortColors(List<int> nums) {

    // Easy not mentioned that we should not use this
    // Time Complexity - O(nLogn)
    // nums.sort();
    
    // without sort 
    // Time Complexity - O(n)
    if(nums.length <= 1) return;
    
    int zeroCount = 0, oneCount = 0, twoCount = 0;
    
    for(int i=0; i<nums.length;i++){
      if(nums[i] == 0) zeroCount++;
      else if(nums[i] == 1) oneCount++;
      else if(nums[i] == 2) twoCount++;
    }
    
    int index = 0;
    for(int i=0; i<zeroCount;i++){ nums[index] = 0; index++; }
    for(int i=0; i<oneCount;i++){ nums[index] = 1; index++; }
    for(int i=0; i<twoCount;i++){ nums[index] = 2; index++; }
  }
}