// My Approach
// Sort All Intervals on basis on start time
// maintain lastInterval as first elemet of sorted intervals
// create count variable and initial to 1
// start for loop from 1 to len-1
// if current.start > lastInterval.endTime, increament count by 1
// Time - O(nlogn)
// Space - O(1)

// Question - https://www.lintcode.com/problem/919/
// Solution - https://www.youtube.com/watch?v=FdzJmTCVyJU

// Time - O(nlogn)
// Space - O(nlogn)

class Interval {
  final int start, end;
  Interval(this.start, this.end);
}

class Solution {
  int minMeetingRooms(List<Interval> intervals) {
    List<int> start = [];
    List<int> end = [];

    for (Interval i in intervals) {
      start.add(i.start);
      end.add(i.end);
    }

    // sort arrays
    start.sort();
    end.sort();

    int res = 0, count = 0;
    int startPointer = 0, endPointer = 0;

    while (startPointer < intervals.length) {
      if (start[startPointer] < end[endPointer]) {
        startPointer++;
        count++;
      } else {
        endPointer++;
        count--;
        if (count >= res) res = count;
      }
    }

    return res;
  }
}
