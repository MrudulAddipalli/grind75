class Solution {
  List<List<int>> insert(List<List<int>> intervals, List<int> newInterval) {
    List<List<int>> data = [];
    int? firstOverLappingIndex, lastOverLappingIndex;
    bool overlapping = false;
    for (int i = 0; i < intervals.length; i++) {
      // len is always 2
      // Algo
      // check newInterval[0] is in between current Interval
      // if yes means over lapping started is true

      // newInterval is between start and end of current interval
      if (intervals[i][0] >= newInterval[0] ||
          newInterval[0] <= intervals[i][1]) {
        if (firstOverLappingIndex == null) firstOverLappingIndex = i;
        if (!overlapping) {
          print("overlapping started @ ${intervals[i][0]} ${intervals[i][1]}");
          overlapping = true;
        }
      }

      if (overlapping) {
        if (intervals[i][0] == newInterval[1] &&
            newInterval[1] < intervals[i][1]) {
          if (lastOverLappingIndex == null) lastOverLappingIndex = i;
          print("overlapping ended @ ${intervals[i][0]} ${intervals[i][1]}");
        }
      }
    }

    if (firstOverLappingIndex != null) {
      if (lastOverLappingIndex == null)
        lastOverLappingIndex = firstOverLappingIndex;
      print(
          "Start - ${intervals[firstOverLappingIndex][0]} ${intervals[firstOverLappingIndex][1]}");
      print(
          "End - ${intervals[lastOverLappingIndex][0]} ${intervals[lastOverLappingIndex][1]}");
    } else {
      // return as it is
      return intervals;
    }

    // create array from 2 indexes and values
    for (int i = 0; i < intervals.length; i++) {
      print("current i - $i");
      if (i != firstOverLappingIndex) {
        data.add(intervals[i]);
        print("adding as it is - ${intervals[i][0]} , ${intervals[i][1]}");
      } else if (i == firstOverLappingIndex) {
        // calculate what to add here and then swift i to remaining indexes of intervals

        List<int> temp = intervals[firstOverLappingIndex];
        List<int> temp2 = intervals[lastOverLappingIndex];
        List<int> ele = [temp[0]];

        // end of the element will depend on highest value
        if (temp2[1] > newInterval[1]) {
          ele.add(temp2[1]);
        } else {
          ele.add(newInterval[1]);
        }

        data.add(ele);

        print("adding transformed element - ${ele[0]} , ${ele[1]}");

        // -1  because for loop will do i++ in the end
        i = i + lastOverLappingIndex - 1;
        print("i after swifting - $i");
      }
    }
    return data;
  }
}

void main() {
  print("Final Array - ${Solution().insert([[1, 3],[6, 9]], [2,5])}");
//   print("Final Array - ${Solution().insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])}");
}
