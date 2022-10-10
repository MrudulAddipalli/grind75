
// Runtime: 739 ms, faster than 16.35% of Dart online submissions for Squares of a Sorted Array.
// Memory Usage: 155.1 MB, less than 51.92% of Dart online submissions for Squares of a Sorted Array.


// Time Complexity - O(nlogn)
// Space Complexity - O(1)

class Solution {
  List<int> sortedSquares(List<int> nums) {
    for(int i=0;i<nums.length;i++){
      nums[i] = nums[i] * nums[i];
    }
    nums.sort(); // Time Complexity - O(nLogn)
    return nums;
  }
}

// Solution - https://www.youtube.com/watch?v=FPCZsG_AkUg


// Optimisation
// Since our array is already sorted
// we can use logic of palindrome

// Runtime: 598 ms, faster than 45.19% of Dart online submissions for Squares of a Sorted Array.
// Memory Usage: 150.3 MB, less than 92.31% of Dart online submissions for Squares of a Sorted Array.

// Time Complexity - O(n/2) but reversed.toList() will take O(n)
// Space Complexity - O(n)

class Solution2 {
  List<int> sortedSquares(List<int> nums) {
    int len = nums.length;
    int left = 0, right = len - 1;
    List<int> res = [];
    while(right >= left){
      int leftVal = nums[left] * nums[left];
      int rightVal = nums[right] * nums[right];
      // more optimisation instead if checking squared values, we can check Abs(nums[left]) > Abs(nums[right])
      // and then storing squared variables like res.add(nums[left] * nums[left])
      // so here we are squaring earlier then checking for largest
      if(leftVal > rightVal){
        res.add(leftVal);
        left++;
      }else{
        res.add(rightVal);
        right--;
      }
    }
    // Reson to reversing , we add values to res array from end, we don't have addAt, even if we had it will take O(n) time complexity for shifting data
    // not sure about dart reverse to list time complexity,
    // our main time complexity will depend on this return statement
    return res.reversed.toList();
  }
}


// Another Solution Works - https://www.youtube.com/watch?v=4eWKHLSRHPY

// Time Complexity - O(n)
// Space Complexity - O(n)

// Runtime: 551 ms, faster than 70.48% of Dart online submissions for Squares of a Sorted Array.
// Memory Usage: 157.5 MB, less than 29.52% of Dart online submissions for Squares of a Sorted Array.


class Solution3 {
  List<int> sortedSquares(List<int> nums) {
    int len = nums.length;
    int left = 0, right = len - 1;
    List<int> res = [];

    for(int i = len - 1 ; i>=0; i--){
      // to avoid index issue
      res.add(0);
    }
    for(int i = len - 1 ; i>=0; i--){
      if( abs(nums[left]) > abs(nums[right]) ){
        res[i] = (nums[left] * nums[left]);
        left++;
      }else{
        res[i] = (nums[right] * nums[right]);
        right--;
      }
    }
    return res;
  }
  int abs(int a){
    return (a < 0) ? (a *  -1) : a;
  }
}