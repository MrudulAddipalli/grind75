
// Solution - https://www.youtube.com/watch?v=REOH22Xwdkk

// Time - O(n * 2^n)

// for n - 3 , loops are 22,
// O(n * 2^n) =  3 * 2^3 = 3 * 8 - 24

class Solution {
  List<List<int>> subsets(List<int> nums) {
    List<List<int>> res = [];
    List<int> subset = [];

    dfs(int index) {
      if (index >= nums.length) {
        res.add([...subset]);
        print("return\n\n");
        return;
      }

      //  decision to include nums[i]
      subset.add(nums[index]);
      print("current subset - $subset");
      print("dfs current index = $index, index+1 = ${index+1}");
      dfs(index + 1);

      //  decision to exclude nums[i]
      subset.removeLast();
      print("current subset after removal - $subset");
      print("dfs current index = $index, index+1 = ${index+1}");
      dfs(index + 1);
    }

    dfs(0);

    return res;
  }
}

class Solution2 {
  List<List<int>> subsets(List<int> nums) {
    List<List<int>> res = [[]];
    for (int i = 0; i < nums.length; i++) {
      List<int> temp = [];
      temp.add(nums[i]);
      // adding individual elements as well
      res = [
        ...res,
        [...temp]
      ];
      print("Current temp * - $temp");
      print("Current res * - $res");
      for (int j = i + 1; j < nums.length; j++) {
        temp.add(nums[j]);
        // adding combinations
        res = [
          ...res,
          [...temp]
        ];
        print("Current temp - $temp");
        print("Current res - $res");
      }
    }
    // out - [[], [1], [1, 2], [1, 2, 3], [2], [2, 3], [3]]
    // res -  [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
    // [1,3] combination is not availble
    return res;
  }
}

void main() {
  List<List<int>> result = Solution().subsets([1, 2, 3]);
  print('Text Case 1 - ${result.toString() == [
        [],
        [1],
        [2],
        [1, 2],
        [3],
        [1, 3],
        [2, 3],
        [1, 2, 3]
      ].toString()}');
}
