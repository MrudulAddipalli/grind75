
// Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1


// Naive Approach - inside 2 for loops iterate and keep count of 1 and 0 in map, if count of 1's and 0's matches
// store the array in output variable
// before updating output variable check of lenght if new sub array is bigger then only update current output
// return output at end 
// Time and Space - O(n^2)


// Approach 2 - Kadane's Algo
// Solution - https://www.youtube.com/watch?v=nSEO5zOwP7g 
// Time - O(n)
// Space - O(1) - constant

class Solution {
  int findMaxLength(List<int> nums) {
    Map<int, int> mp = {};
		mp[0] = -1;
		int maxx = 0, sum = 0;
		for (int i = 0; i < nums.length; i++){
			sum += (nums[i] == 1) ? 1 : -1;
			if (mp.containsKey(sum)) maxx = max(i - mp[sum]!, maxx);
			else mp[sum] = i;
		}
		return maxx;

  }
  int max(int a, int b) => a > b ? a : b;
}

// Arr              0  1  0  1  1  1  0    0
// Sum = 0,        -1  0 -1  0  1  2  1    0
// maxx                2  2  4       (4)$ (8)*
// map[0] = -1      0  /  2  /  4  5  /    /

// return maxx i.e 8


// $ --- Max(6-4,4) = 4
// * --- Max(7+1 = 8,4) = 8