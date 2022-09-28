class Solution {
  String addBinary(String a, String b) {
    late String max, min, result = "";
    late int carry = 0, i = 0, x, y, sum = 0;

    if (a.length >= b.length) {
      max = a;
      min = b;
    } else {
      max = b;
      min = a;
    }
    if (max.length != min.length) {
      int diffChars = max.length - min.length;
      // add preceeding zeros for short num
      for (i = 0; i < diffChars; i++) {
        min = "0" + min;
      }
    }

    print("Current Max - $max , Min - $min");

    // now both numbers are of same size

    for (i = min.length - 1; i >= 0; i--) {
      print("Calculate for i - $i");
      x = int.parse(min[i]);
      y = int.parse(max[i]);
      int temp = x + y + carry;
      if (temp == 3) {
        sum = 1;
        carry = 1;
      } else if (temp == 2) {
        sum = 0;
        carry = 1;
      } else {
        sum = temp;
        carry = 0;
      }
      result = sum.toString() + result; // end to start
      print("x - $x, y - $y, sum - $sum, carry - $carry, result - $result");
    }

    // handle carry for last calculation

    if (carry != 0) {
      print("handle carry for last calculation");
      result = carry.toString() + result; // end to start
      carry = 0;
      print("x - $x, y - $y, sum - $sum, carry - $carry, result - $result");
    }

    return result;
  }
}

void main() {
  Solution sol = Solution();
  print(sol.addBinary("1111", "1111"));
}


/// Same Code In Java

// Runtime: 4 ms, faster than 48.66% of Java online submissions for Add Binary.
// Memory Usage: 42.1 MB, less than 87.81% of Java online submissions for Add Binary.


//  class Solution {
//     public String addBinary(String a, String b) {
//     String max,min, result = "";
//     int carry = 0;
    
//     if(a.length() >= b.length()){
//       max = a;
//       min = b;
//     }else{
//       max = b;
//       min = a;
//     }
    
//     if(max.length() != min.length()){
//       int diffChars = max.length() - min.length();
//       // add preceeding zeros for short num
//        for(int i=0;i<diffChars;i++){
//          min = "0" + min;
//        }
//     }
    
//     // now both numbers are of same size
//     for(int i=min.length()-1;i>=0;i--){
//       int x =  Integer.parseInt(""+min.charAt(i)+"");
//       int y =  Integer.parseInt(""+max.charAt(i)+"");
//       int temp = x + y + carry;
//       int sum = 0;
//       if(temp == 3){
//         sum = 1;
//         carry = 1;
//       } else if(temp == 2){
//         sum = 0;
//         carry = 1;
//       }else{
//         sum = temp;
//         carry = 0;
//       }
//       result = Integer.toString(sum) + result;
//     }
    
//     // handle carry for last calculation
//     if(carry != 0){
//       result = Integer.toString(carry) + result;
//     }
    
//     return result;
//   }
  
// }