// runApp() twice

// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.

// Example 1:

// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
// Example 2:

// Input: nums = [3,2,4], target = 6
// Output: [1,2]
// Example 3:

// x + 2 = 9
// x = target - nums[i]

// class finder {
//   List<int> findPositions(List<int> nums, int target) {
//     List<int> result = [];
//     // key will be number, value will be index
//     Map<int, int> numMapper = {};

//     for (int i = 0; i < nums.length; i++) {
//       int currentNumber = nums[i];
//       int findNumber = target - currentNumber;
//       if (numMapper.containsKey(findNumber)) {
//         return [numMapper[findNumber]!, i];
//       }
//       numMapper.addAll({currentNumber: i});
//     }
//     return result;
//   }
// }


// Find the Intersection of Two Lists

// **Problem:** Given two lists of integers, write a Dart function to find their intersection.

// void main() {
//   List<int> list1 = [1, 2, 3, 4, 5];
//   List<int> list2 = [3, 4, 5, 6, 7];
//   List<int> intersection = findIntersection(list1, list2);
//   print(intersection);  // Output: [3, 4, 5]
// }

// hashmap
// map{list1[i]: (map(list[i]).value ?? 0) + 1}
// map{list2[i]: 1}

// check first element of each list , and find min
// min is from list 1
// iterate list 1 till I find first element from list2, I will stop at index 2[3]