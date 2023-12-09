

// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

// Solution 1
// loop1 - sort array - O(nlogn)
// loop2 - check if arr[i] == arr[i+1] -> return true
// Time Complexity - O(nlogn) + O(n) = O(nlogn)
// Space Complexity - O(1) - for maintaining sum
// Code Readibilty - Low

// Solution 2
// loop1 - iterate array and update map map where each number will be key and value will be count
// loop2 - iterate map key values and if count > 1 return true; [ contains duplicate ] else false as default
// Time Complexity - O(n) + O(n) = O(n)
// Space Complexity - O(n) - for map
// Code Readibilty - High


