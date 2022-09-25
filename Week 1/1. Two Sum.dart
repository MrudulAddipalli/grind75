class Solution {
  List<int> twoSum(List<int> nums, int target) {
      for(int i=0;i<nums.length;i++){
          int k = (i+1 == nums.length) ? nums.length :  i+1;
           for(int j=k;j<nums.length;j++){
             if(nums[i]+nums[j] == target){
              return [i,j];
            }
         }
      }
     return [];
  }
}
