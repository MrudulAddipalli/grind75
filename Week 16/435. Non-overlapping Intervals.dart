// Solution - https://www.youtube.com/watch?v=nONCGxWoUfM

// My Approach
// Sort Array On Start [ use custom compare for sort ]
// store first interval in curr interval
// and iterate all , and check if overlapping found update counter
// else update curr interval
// return curr as result

class Solution {
  int eraseOverlapIntervals(List<List<int>> intervals) {
    int count = 0;
    // sort intervals on basis of start
    intervals.sort((x, y) => (x[0]).compareTo(y[0]));
    int prevEnd = intervals.first[1];
    for (int i = 1; i < intervals.length; i++) {
      int start = intervals[i][0];
      int end = intervals[i][1];
      if (start >= prevEnd) {
        prevEnd = end;
      } else {
        count++;
        // main logic,
        // if we have [ [2,4], [1,3], [1,2] ]
        // sorting will give [ [1,3], [1,2], [2,4] ]
        // overlapping interval is 1,3 and not 1,2,
        // if we don't update prevEnd here then our current prevEnd will be 3,
        // which will make [2,4] interval as overlapping
        prevEnd = min(end, prevEnd);
      }
    }
    return count;
  }

  int min(int a, int b) => a > b ? b : a;
}
