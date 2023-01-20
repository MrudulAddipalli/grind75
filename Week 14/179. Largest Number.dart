// Naive approach
// Sort Array Desc Order, and single digits number will come first, then double and triple
// as per given constraints - 1 <= nums.length <= 100 , we can easily sort the array
// how to sort numbers on digits basis
// given number will be 0 <= nums[i] <= 10^9 - 10000000000
// create map for each digits
// if number has single digits it will go to map[1]
// if double it will go to map[2], and so on
// once map is ready , sort each values of List<num> for each ket digit of map
// last

// Time -  50% - O(nlogn) - sort
// Space - 100% - O(n) - array

class Solution {
  String largestNumber(List<int> nums) {
    List<String> numbers = [];
    nums.forEach((element) {
      numbers.add(element.toString());
    });

    // sort
    numbers.sort((a, b) {
      if (int.parse(a + b) > int.parse((b + a))) return -1;
      return 1;

      // -1 will take "a" as larger
      // 1 will take "b" as larger
    });

    // all numbers are ["0","0"], we are returing "00" instead of just "0"
    final String res = numbers.join(""); 
    // nums.lenght >= 1 , so res.first will not throw any issues
    if(res[0] == "0") return "0";
    return res;
  }
}
