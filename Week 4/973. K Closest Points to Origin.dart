

// Solution - https://www.youtube.com/watch?v=rI2EBUEMfTk

// Time Complexity - O(n) - heap insertion is O(n)
// Space Complexity - O(n) - for heap and res

// Runtime: 886 ms, faster than 87.28% of Python3 online submissions for K Closest Points to Origin.
// Memory Usage: 20.5 MB, less than 21.29% of Python3 online submissions for K Closest Points to Origin.



// Heap is nothing but array - https://www.raywenderlich.com/books/data-structures-algorithms-in-dart/v1.0/chapters/13-heaps
// where elements are added in priority wise
// if 10 is in the heap and if we add 5, it will check where to add before 10 or after 10, depending on heap type
// if MinHeap than before 10, if Maxheap than ater 10


// class Solution:
//     def kClosest(self, points: List[List[int]], k: int) -> List[List[int]]:
//         minHeap = []
//         for x,y in points:
//             dist = (x ** 2) + ( y ** 2)
//             minHeap.append([dist,x,y])

//         heapq.heapify(minHeap)
//         res = []
//         while k>0:
//             dist, x, y = heapq.heappop(minHeap)
//             res.append([x,y])
//             k -= 1

//         return res

import 'dart:math';

// Issue with this solution - if we get distance of all or some points same then we will update same distances map under same key
// and our sortedDistances list will only have 1 key, so our distances list will have only 1 co ordinates
// Run the example with
// print("Final Array - ${Solution().kClosest([[0, 1],[1, 0]], 2)}");

// Time Complexity - O(nlogn) - for sort()
// Space Complexity - O(n) - for distances and result

class Solution1 {
  List<List<int>> kClosest(List<List<int>> points, int k) {
    Map<num, List<int>> distances = {};
    List<List<int>> result = [];

    // find distance and store in Map
    for (List<int> point in points) {
      num dis = distanceFromOrigin(point[0], point[1]);
      distances[dis] = point;
      String coor = "${point[0]} ${point[1]}";
      print("Distance of $coor from origin is - $dis");
    }

    // sort all distances to find K nearest points
    // here Key of map is distances from origin of each co ordinate
    List<num> sortedDistances = distances.keys.toList()..sort();

    // sub list will only give K nearest distances
    if (k < sortedDistances.length) {
      sortedDistances = sortedDistances.sublist(0, k);
    }

    // now return all coordinates which are nearest to origin
    for (num distance in sortedDistances) {
      if (distances[distance] != null) result.add(distances[distance]!);
    }

    return result;
  }

  num distanceFromOrigin(int x, int y) {
    // √(x1 - x2)^2 + (y1 - y2)^2
    // since we need to find distance of point from origin
    // so our formula is √(x1 - 0)^2 + (y1 - 0)^2
    // √(x1)^2 + (y1)^2
    // i.e √(x)^2 + (y)^2

    return pow(pow(x, 2) + pow(y, 2), 1 / 2);
//     or
//     return sqrt(pow(x,2) + pow(y,2));
  }
}

void main() {
  print("Final Array - ${Solution1().kClosest([
        [0, 1],
        [1, 0]
      ], 2)}");
}
