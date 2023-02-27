

// Solution - https://www.youtube.com/watch?v=zx5Sw9130L0

class Data {
  int height;
  int startIndex;
  Data(this.height, this.startIndex);
}

class Solution {
  int largestRectangleArea(List<int> heights) {
    // edge case
    heights.add(0);

    int maxArea = 0;
    List<Data> stack = [];

    for (int currentIndex = 0; currentIndex < heights.length; currentIndex++) {
      int startIndex = currentIndex;
      int currentHeight = heights[currentIndex];

      // if previous height which was added in stack was larger then currentHeight
      // pop from stack and calculate heights

      while (stack.isNotEmpty && stack.last.height > currentHeight) {
        Data data = stack.removeLast();
        int currentArea = data.height * (currentIndex - data.startIndex);
        maxArea = max(maxArea, currentArea);
        // since we are popping so we need update start index to prevoius index
        // until we get a height which is smaller then current
        startIndex = data.startIndex;
      }

      stack.add(Data(currentHeight, startIndex));
    }

    // process remaning heights where we have all increasing heights
    int lastIndex = heights.length;
    for (int i = 0; i < stack.length; i++) {
      Data data = stack.removeLast();
      int area = data.height * (lastIndex - data.startIndex);
      maxArea = max(maxArea, area);
    }

    return maxArea;
  }

  int max(int a, int b) => a > b ? a : b;
}
