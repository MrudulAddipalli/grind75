// My Approach - Linear Increamenting The Distance, but if first index says 3, means I can either go to index 1/2/3
// 148 / 170 Test Cases Passed
// Time - O(n), n - nums.length

class NaiveSolution {
  bool canJump(List<int> nums) {
    int i = 0;
    for (i = 0; i < nums.length; i++) {
      i = i + nums[i];
      // index out of bound
      if (i >= nums.length - 1) return true;
      // goal cannot be reached, as more steps are remaining
      if (nums[i] == 0 && i < nums.length) {
        return false;
      }
    }
    return false;
  }
}

// Greedy Approach
// Solution - https://www.youtube.com/watch?v=Yan0cv2cLy8
// Time - O(n)

class Solution {
  bool canJump(List<int> nums) {
    // start from end
    int goal = nums.length - 1;
    for (int i = nums.length - 1; i >= 0; i--) {
      // if current index + jump is equal to goal - means with current jump of nums[i] we can reach goal [last index]
      if (i + nums[i] >= goal) {
        // updating goal to closer index
        goal = i;
      }
    }
    // if goal is zero means from start we can reach goal
    return (goal == 0) ? true : false;
  }
}


void main() {
//  print("${Solution().canJump([2,3,1,1,4])}");
  print("${Solution().canJump([3, 2, 1, 0, 4])}");
}
