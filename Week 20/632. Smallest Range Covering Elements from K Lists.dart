// Solution - https://www.youtube.com/watch?v=VIbaPmsRzCs&t=96s

class Pair {
  final int number;
  final int index;
  Pair({
    required this.number,
    required this.index,
  });
}

class Solution {
  List<int> smallestRange(List<List<int>> nums) {
    int arrayCount = nums.length;
    List<Pair> arr = [];
    List<int> res = [];
    for (int i = 0; i < arrayCount; i++) {
      for (int num in nums[i]) {
        arr.add(Pair(number: num, index: i));
      }
    }
    // sort on basis of number in asc order
    arr.sort((a, b) => a.number - b.number);

    // logic
    int minimumArrayLen = 51;
    Map<int, int> map = {};
    int totalArrayCount = 0;
    int j = 0;

    void updateResultAndLength(int i, int j) {
      int range = arr[i].number - (arr[j].number + 1);
      if (range < minimumArrayLen) {
        // updating range
        minimumArrayLen = range;
        res = [arr[j].number, arr[i].number];
      }
    }

    for (int i = 0; i < arr.length; i++) {
      map[arr[i].index] = (map[arr[i].index] ?? 0) + 1;
      // means atleast 1 number from particular array [arr[i].index] exist in our range from j to i
      if (map[arr[i].index] == 1) totalArrayCount++;

      if (totalArrayCount == arrayCount) {
        updateResultAndLength(i, j);
        // shrink range
        while (true) {
          // decrement map count and shift "j" left pointer
          if ((map[arr[j].index] ?? 0) > 1) {
            // update map count
            map[arr[j].index] = (map[arr[j].index] ?? 0) - 1;
            // shift j from left to right
            j++;
          } else {
            break;
          }
        }
        updateResultAndLength(i, j);
      }
    }

    return res;
  }
}
