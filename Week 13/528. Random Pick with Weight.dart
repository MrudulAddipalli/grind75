// Solution - https://www.youtube.com/watch?v=3Ky9ZlI95cY
// Solution - https://www.youtube.com/watch?v=fWS0TCcr-lE

import 'dart:math';

class Solution {
  late List<int> sum;
  int max = 0;
  Random randomizer = Random();

  Solution(List<int> w) {
    sum = List.filled(w.length, 0);

    // 1 <= w.length <= 104
    sum[0] = w.first;

    for (int i = 1; i < w.length; i++) {
      sum[i] = sum[i - 1] + w[i];
    }

    max = sum.last;
  }

  int pickIndex() {
    // binary search
    int low = 0, high = sum.length - 1;
    int target = randomizer.nextInt(max);

    while (low <= high) {
      int mid = low + (high - low) ~/ 2;
      if (sum[mid] == target) return mid;
      if (target < sum[mid]) {
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }

    return low;
  }
}
