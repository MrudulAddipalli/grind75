
//                                                   5
//                                    4                                       3
//                             3           2                             2         1
//                         2      1      1   0                         1   0    1
//                     1      0   1      1                             1        1
//                     0          0      0                             0        0



// generate(n){
//     if(n<0) return 0;
//     if(n == 0) return 1;
//     return generate(n-1) + generate(n-2);
// }

// generate(5);


// generate(n){
//     if(n == 1) return 1; 
//     if(n == 2) return 2; 
//     int x = climbStairs(n-1);
//     int y = climbStairs(n-2);
//     return x + y;
// }



// https://www.youtube.com/watch?v=Y0lT9Fck7qI

class Solution {
  int climbStairs(int n) {
    int last = 1, secondLast = 1, temp = 0, i = 0;
    for (i = 0; i < n - 1; i++) {
      // Fibonacci Series
      temp = last + secondLast;
      last = secondLast;
      secondLast = temp;
    }
    return secondLast;
  }
}

// 1 + 1 + 1 + 1 + 1
// 1 + 2 + 1 + 1
// 1 + 2 + 2
// 2 + 2 + 1
// 2 + 1 + 2
// 2 + 1 + 1 + 1
// 1 + 1 + 2 + 1
// 1 + 1 + 1 + 2

void main() {
  print("Status - ${Solution().climbStairs(5)}");
}

