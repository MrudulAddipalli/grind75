// Constraints - Note that you must do this in-place without making a copy of the array.

// Failed for [0,0,1]
class Solution {
  void moveZeroes(List<int> nums) {
    int zerosCount = 0;
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 0) {
        zerosCount++;
        nums.removeAt(i);
      }
      print(i);
    }
    for (int i = 1; i <= zerosCount; i++) {
      nums.add(0);
    }
  }
}

// Failed for [0,0,1]
// because we updated array for first zero to [0,1,0] , hence at last zero,
// loop didn't work as ther is not further elements in the array
class Solution2 {
  void moveZeroes(List<int> nums) {
    for (int i = 0; i < nums.length; i++) {
      if (nums[i] == 0) {
        // shift array to left by 1
        print("\n\nbefore - $nums");
        shiftZeroAtIndexToEnd(i, nums);
        print("after - $nums");
      }
    }
  }

  void shiftZeroAtIndexToEnd(int index, List<int> nums) {
    print("shiftZeroAtIndexToEnd for ${nums[index]} at index - $index");
    if (index <= nums.length - 1) {
      int temp = nums[index];
      // Logic - i is starting from index
      for (int i = index; i < nums.length - 1; i++) {
        nums[i] = nums[i + 1];
      }
      print("nums[nums.length-1] - ${nums[nums.length - 1]}");
      nums[nums.length - 1] = temp;
      print("2 nums[nums.length-1] - ${nums[nums.length - 1]}");
    }
  }
}


// https://www.youtube.com/watch?v=aayNRwUN3Do