// Not Working for [[1,4],[0,1]],
// this requires sorting of 2D array of given intervals
// on what to sort - only on start value interval[0]

// Solution - https://www.youtube.com/watch?v=44H3cEC2fFM

// Time Complexity - O(nlogn) [for sort] + O(n) - for looping intervals - final O(nlogn) 
// Space Complexity - O(n)

// Runtime: 612 ms, faster than 71.43% of Dart online submissions for Merge Intervals.
// Memory Usage: 151.1 MB, less than 78.57% of Dart online submissions for Merge Intervals.

class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    if(intervals.length <= 1) return intervals;

    // new addition for [[1,4],[0,1]],
    intervals.sort((x, y) => (x[0]).compareTo(y[0]));

    List<List<int>> res = [];
    List<int> interval = intervals.first;
    for(int i = 1 ; i<intervals.length; i++){
      int start = intervals[i][0], end = intervals[i][1];
      print("Interval start ${start} end ${end}");

      // this not working for [[1, 4], [2, 3]], where output is [1,4]
      // if(interval[1] >= start && interval[1] <= end) {

      // final working condition
      if(interval[1] >= start && ( interval[1] <= end || end <= interval[1])) { 

        print("in Range");
        interval = [min(interval[0], start), max(interval[1],end)];
        print("updated Interval -  $interval");
      }else{
        print("not in interval so add updated interval to result");
        res.add(interval);
        print("res - $res");
        // update interval for next check
        interval = intervals[i];
        print("updated Interval -  $interval");
      }
    }
    res.add(interval);
    return res;
  }
  
  int min(int a,int b){
    return a>b ? b : a;
  }
  
  int max(int a, int b) {
    return a > b ? a : b;
  }
}


void main() {
//   print("Result - ${Solution().merge([[1,3],[2,6],[8,10],[15,18]])}");
  print("Result - ${Solution().merge([[1,3],[2,6],[8,10],[9,18]])}");
}