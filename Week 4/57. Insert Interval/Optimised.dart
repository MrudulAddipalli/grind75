
// Solution - https://www.youtube.com/watch?v=A8NUOmlwOlM

// Time Complexity - O(n)
// Space Complexity - O(n) - since using res as 2D Array 

// Runtime: 481 ms, faster than 62.50% of Dart online submissions for Insert Interval.
// Memory Usage: 146.1 MB, less than 12.50% of Dart online submissions for Insert Interval.


class Solution {
  List<List<int>> insert(List<List<int>> intervals, List<int> newInterval) {
    List<List<int>> res = [];
    for (List<int> currentInterval in intervals) {
      // no more overlapping intervals found
      if (newInterval[1] < currentInterval[0]) {
        // add updated newInterval
        res.add(newInterval);
        // add remaining intervals
        for (int i = intervals.indexOf(currentInterval);
            i < intervals.length;
            i++) {
          res.add(intervals[i]);
        }
        // return res
        return res;
      }
      // not overlapping with updated newInterval
      else if (newInterval[0] > currentInterval[1]) {
        res.add(currentInterval);
      }
      // overlapping intervals found, 
      // so update out newInterval value
      else {
        // newInterval start and end values will min and max 
        // of currentInterval and newInterval
        newInterval = [
          min(currentInterval[0], newInterval[0]),
          max(currentInterval[1], newInterval[1])
        ];
      }
    }
    // if newInterval is not appended and returned then we need
    // append the updated newInterval to the res
    // if newInterval is already appended then this code will not be executed
    // since we are returning at line 20
    res.add(newInterval);
    return res;
  }

  int min(int a, int b) {
    return a < b ? a : b;
  }

  int max(int a, int b) {
    return a > b ? a : b;
  }
}
