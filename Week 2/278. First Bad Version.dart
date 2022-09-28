// The API isBadVersion is defined for you.
// bool isBadVersion(int version);


// This is a binary search algorithm
// Runtime: 0 ms, faster than 100.00% of C++ online submissions for First Bad Version.
// Memory Usage: 5.9 MB, less than 22.90% of C++ online submissions for First Bad Version.

// same code rerun

// Runtime: 0 ms, faster than 100.00% of C++ online submissions for First Bad Version.
// Memory Usage: 5.6 MB, less than 99.19% of C++ online submissions for First Bad Version.


class Solution {
  // comment below method
  bool isBadVersion(int n) {
    return false;
  }

  int firstBadVersion(int n) {
    int max = n, min = 0, mid = 0;
    while (min < max) {
      mid = min + (max - min) ~/ 2;

      if (isBadVersion(mid)) {
        max = mid;
      } else {
        min = mid + 1;
      }
    }
    if (min == max && isBadVersion(min)) return min;
    return -1;
  }
}


// after moving int declaration inside - int mid = min + (max - min) / 2; 

// Runtime: 4 ms, faster than 25.82% of C++ online submissions for First Bad Version.
// Memory Usage: 5.9 MB, less than 22.90% of C++ online submissions for First Bad Version.