
// https://www.youtube.com/watch?v=RyBM56RIWrM


class Solution {
  List<int> countBits(int n) {
    List<int> dp = [];
    int offset = 1;
    for(int i=0; i<= n; i++){
      // updating offset
      if(offset * 2 == i) { offset = i; }
      // adding element to avoid index error
      dp.add(0);
      int index = i-offset;
      // for 0th element  0 - offset = -1, hence for 0 binary will have 0 1's, hence not processing
       if(index >= 0){
        dp[i] = 1 + dp[i-offset];
      }
    }
    return dp;
  }
}

void main(){
  print(Solution().countBits(5));
}