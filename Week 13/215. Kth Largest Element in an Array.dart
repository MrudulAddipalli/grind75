// Problem Statement
// Given an integer array nums and an integer k, return the kth largest element in the array.
// Note that it is the kth largest element in the sorted order, not the kth distinct element.
// Note: You must solve it in O(n) time complexity.

// Approach 1
// sorting will solve the problem , after sorting we don't have to remvoe duplicate elements
// and send kth index element
// this will have O(nlogn) [sorting]
// arr.sort(); // ascending order
// return arr[ len(arr) - k ];

// Approach 2
// Next Approach Is Min Heap or Max Heap which will give time complexity of
// O(k log(n) ) - for popping in max heap, log n for popping , since we need to pop for k times
// hence it's k * log(n)
// O((n-k+1) log(n-k+1) ) - for popping in min heap
// O(n) is for building heap
// so with max heap our overall time complexity is O(n +klogn)
// so with min heap our overall time complexity is O( n + (n-k+1) log (n-k+1) )
// hence this also does not satisfy our requirement of O(n)

// Approach 3 - Quick Select
// Quick Select Algo - https://www.youtube.com/watch?v=BP7GCALO2v8
// Solution - https://www.youtube.com/watch?v=XEmy13g1Qxc&t=955s

// Using Quick Select
// Time Complexity - n + n/2 + n/4 ~ = 2xN --> O(n) -- 90%
// Space Complexity - O(1)                          -- 30%

class Solution {
  int findKthLargest(List<int> nums, int k) {
    k = nums.length - k;

    void swap(int x, int y) {
      int t = nums[y];
      nums[y] = nums[x];
      nums[x] = t;
    }

    int quickSelect(int l, int r) {
      int pivot = nums[r];
      int p = l;

      for (int i = l; i < r; i++) {
        if (nums[i] <= pivot) {
          swap(p, i);
          p += 1;
        }
      }

      // swapping with pivet and pointer
      swap(p, r);

      if (p > k) {
        return quickSelect(l, p - 1);
      } else if (p < k) {
        return quickSelect(p + 1, r);
      }
      return nums[p];
    }

    return quickSelect(0, nums.length - 1);
  }
}
