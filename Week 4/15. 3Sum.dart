
// Time Complexity - O(nlogn) [ array sort ] + O(n^2) [ for and while loop for pointers for calculcating 2 sums ]
//                 - O(nlogn)                + O(n^2)
//                 - O(n^2)

// Space Complexity - O(n) [ for storing res ]

// Runtime: 663 ms, faster than 64.00% of Dart online submissions for 3Sum.
// Memory Usage: 150.6 MB, less than 90.00% of Dart online submissions for 3Sum.


class Solution2 {
  List<List<int>> threeSum(List<int> nums) {
    List<List<int>> res = [];

    nums.sort();

    for(int i=0; i< nums.length;i++){
      // first element
      int a = nums[i];
      if(i>0 && a == nums[i-1]) continue;

      // since first element is a, hence l starts from next element
      int l = i+1, r = nums.length-1;
      int threeSum = 0;
      while (l<r){
        threeSum = a + nums[l] + nums[r];
        // sum is becoming greater hence in sorted array we will get smaller number just before right pointer
        if(threeSum > 0) r--;
        // sum is becoming shorter hence in sorted array we will get bigger number just after left pointer
        else if(threeSum < 0) l++;
        // adding the result when threeSum calculates to 0
        else {
          // means sum is 0
          res.add([ a,nums[l],nums[r] ]);
          // update pointer
          // since first element a is solved we need to move to next element
          l++;
          // also if the next element is same we don't need to get 2 sums for a
          // while loop order matters, let say for loop is at i = 0
          // then after l++; l is 2,
          // so we are checking is nums[2] == nums[1], means same result we will get
          // hence moving left pointer (l) to next element
          while(l<r && nums[l] == nums[l-1]){
            // This is optimisation, also this removes duplicate entry in the result
            l++;
          }
        }
      }
    }

    return res;
  }
}

// Time Limit Exceeded

// Time Complexity - O(n^3)
// Space Complexity - O(n)

class Solution {
  List<List<int>> threeSum(List<int> nums) {
    List<List<int>> arr = [];

    nums.sort();

    bool containsOrNot(List<int> temp) {
      for (int i = 0; i < arr.length; i++) {
        int count = 0;
        for (int j = 0; j < arr[i].length; j++) {
          if (arr[i][j] == temp[j]) count++;
        }
        if (arr[i].length == count) return true;
      }
      return false;
    }

    for (int i = 0; i < nums.length; i++) {
      for (int j = i; j < nums.length; j++) {
        for (int k = j; k < nums.length; k++) {
          if (i != j && j != k && i != k) {
            if (nums[i] + nums[j] + nums[k] == 0) {
              final List<int> temp = [nums[i], nums[j], nums[k]];
              if (!containsOrNot(temp)) arr.add(temp);
            }
          }
        }
      }
    }
    return arr;
  }
}

void main() {
  print("Final Array - ${Solution2().threeSum([-1, 0, 1, 2, -1, -4])}");
}
