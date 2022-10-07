

// Old Good Approach - https://www.youtube.com/watch?v=yubRKwixN-U
// but this will require 2 loops first for getting units place value in div
// and second for calculation, but this for loop will be equivalent to our loop 0 - len/2



// Below Solution failing for dart same working in Java

class Solution {
  bool isPalindrome(int x) {
    if (x<0) return false;
    String s1 = x.toString();
    for(int i=0; i<=s1.length/2 ; i++){
      if(s1[i] != s1[s1.length - 1 - i]) return false;
    }
    return true;
  }
}

// Java Solution

// class Solution {
//     public boolean isPalindrome(int x) {
//         if (x<0) return false;
//         String s1 = x + "";// String conversion
//         for(int i=0; i<=s1.length() /2 ; i++) {
//           if( s1.charAt(i) != s1.charAt(s1.length() - 1 - i) ) return false;
//         }
//         return true;
//     }
// }