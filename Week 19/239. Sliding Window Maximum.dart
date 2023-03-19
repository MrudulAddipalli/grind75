// Solution - https://www.youtube.com/watch?v=DfljaUwZsOk&t=505s

// Time - O(n)
// Space - O(n)

class Solution {
  List<int> maxSlidingWindow(List<int> nums, int k) {
    List<int> output = [];
    // queue contains index of numbers from nums list
    // Monotonically Decreasing Queue
    List<int> queue = [];
    int left = 0, right = 0;

    while (right < nums.length) {
      // if recently added values [ i.e index ] is less then current number [num[right]],
      // then remove smallest numbers [i.e index] from queue
      while (queue.isNotEmpty && queue[queue.length - 1] < nums[right]) {
        queue.removeLast();
      }

      queue.add(right);

      // remove left index [ first index ] from queue which is out of bound
      if (left > queue[0]) {
        // edge case if above while loop was not able to pop from queue due to contraints
        // then we need to remove it if numbers are not in valid window range
        queue.removeAt(0);
      }

      // formed window of size k
      if (right + 1 >= k) {
        output.add(nums[queue[0]]);
        left++;
      }

      right++;
    }
    return output;
  }
}
