// Time - O(n)
// Space - O(1)

// Solution - https://www.youtube.com/watch?v=UuiTKBwPgAo

// Runtime: 345 ms, faster than 100.00% of Dart online submissions for Container With Most Water.
// Memory Usage: 188.7 MB, less than 5.75% of Dart online submissions for Container With Most Water.

class Solution {
  int maxArea(List<int> height) {
    int maxArea = 0;

    int l = 0, r = height.length - 1;
    while (l < r) {
      int currentArea = min(height[l], height[r]) * (r - l);
      maxArea = max(currentArea, maxArea);
      if (height[l] < height[r])
        l++;
      else
        r--;
    }
    return maxArea;
  }

  int min(int x, int y) {
    return (x > y) ? y : x;
  }

  int max(int x, int y) {
    return (x > y) ? x : y;
  }
}

// Time - O(n^2)
// Space - O(1)

// Time Limit Exceeded - Brute Force Approach
class Solution2 {
  int maxArea(List<int> height) {
    int maxArea = 0;

    for (int i = 0; i < height.length; i++) {
      for (int j = i; j < height.length; j++) {
        int lineOne = height[i];
        int lineTwo = height[j];
        int diff = min(lineOne, lineTwo);
        int length = (j - i);
        print("length - $length");
        int currentArea = diff * length;
        print("currentArea - $currentArea");
        if (maxArea < currentArea) {
          maxArea = currentArea;
        }
      }
    }
    return maxArea;
  }

  int min(int x, int y) {
    return (x > y) ? y : x;
  }
}

// Same Above Solution in python

// Time - O(n^2)
// Space - O(1)

// Time Limit Exceeded - Brute Force Approach

// class Solution:
//     def maxArea(self, height: List[int]) -> int:
//         maxArea = 0
//         for i in range(len(height)):
//             for j in range(i+1,len(height)):
//                 currentArea = min(height[i], height[j]) * (j - i)
//                 maxArea = max(currentArea,maxArea)
//         return maxArea

// Time - O(n)
// Not Working For - [1,2,1]
class Solution3 {
  int maxArea(List<int> height) {
    int maxArea = 0;
    int lineOne = height[0];

    int lineOneIndex = 0;
    for (int i = 1; i < height.length; i++) {
      int lineTwo = height[i];
      int lineTwoIndex = i;

      print("lineOne - ${lineOne} at index $lineOneIndex");
      print("lineTwo - ${lineTwo} at index $lineTwoIndex");

      int diff = min(lineOne, lineTwo);
      int lenght = (lineTwoIndex - lineOneIndex);

      print("lenght - $lenght");

      int currentArea = diff * lenght;
      print("currentArea - $currentArea");
      if (maxArea < currentArea) {
        maxArea = currentArea;
      }
      if (lineOne < lineTwo) {
        lineOne = lineTwo;
        lineOneIndex = lineTwoIndex;
      }
    }
    return maxArea;
  }

  int min(int x, int y) {
    return (x > y) ? y : x;
  }
}

void main() {
//   print("Result - ${Solution().maxArea([1,8,6,2,5,4,8,3,7])}");
//   print("Result - ${Solution().maxArea([1,1])}");
  print("Result - ${Solution().maxArea([1, 2, 1])}");
}
