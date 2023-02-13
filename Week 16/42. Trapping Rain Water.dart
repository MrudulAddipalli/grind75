

// Solution - https://www.youtube.com/watch?v=ZI2z5pq0TqA

// Time - O(n) - 94%
// Space - O(1) - 37%

class Solution {
  int trap(List<int> height) {
    int res = 0;
    if (height.isEmpty) return res;
    int left = 0, right = height.length - 1;
    int leftMax = height[left];
    int rightMax = height[right];
    while (left < right) {
      if (leftMax < rightMax) {
        left++;
        leftMax = max(leftMax, height[left]);
        res += leftMax - height[left];
      } else {
        right--;
        rightMax = max(rightMax, height[right]);
        res += rightMax - height[right];
      }
    }
    return res;
  }
  int max(int a, int b) => a > b ? a : b;
}
