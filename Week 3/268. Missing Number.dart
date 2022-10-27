
// Other Solutions - https://www.youtube.com/watch?v=WnPLSRLSANE

// Solution 2 - Time Complexity O(n) and Space Complexity O(1),

// Take sum of all numbers from 0 or n, where is lenght of given array
// Take sum of given array 
// subtract both sum and return the result, which is actually the missing number





// Runtime: 389 ms, faster than 93.94% of Dart online submissions for Missing Number.
// Memory Usage: 158.3 MB, less than 6.06% of Dart online submissions for Missing Number.

// Time Complexity - O(nlogn) - for sorting
// Space Complexity - O(1) - as required

class Solution {
  int missingNumber(List<int> nums) {
    // not required as per the constraints list will not be empty
    // if (nums.isEmpty) return 0; // n = null missing number is 0

    // for loop is needd here because we are loop from 0 to n to find missing number
    nums.sort();

    // as per defination , n = len of nums, but we are using n as biggest element 
    int n = nums.last, i = 0;
    for(i = 0 ;i<n ; i++){
      // i != n, handled for [0,1] , where n becomes 1, we should return 1 here, we have to return 2 which is missing
      if(nums[i] != i && i!=n){
        return i;
      }
    }
    // if n == i, means i reached till 1, means we have somthing to return which is not present in arr iteration
    return i==n? n++ : i;
  }
}


