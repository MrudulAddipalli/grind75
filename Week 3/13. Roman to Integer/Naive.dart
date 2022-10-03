

// Runtime: 1068 ms, faster than 23.92% of Dart online submissions for Roman to Integer.
// Memory Usage: 149.6 MB, less than 53.42% of Dart online submissions for Roman to Integer.


// I can be placed before V (5) and X (10) to make 4 and 9. 
// X can be placed before L (50) and C (100) to make 40 and 90. 
// C can be placed before D (500) and M (1000) to make 400 and 900.  
class Solution {
  int sum = 0;
  int romanToInt(String s) {
    int len = s.length;
    if(len == 0) return 0;
    print("Finding Integer Number For $s");
    int i = 0;
    bool doubleAddition = false;
    for(i = 0;i< len - 1;i++){
      if(s[i]+s[i+1] == "IV" ){ sum += 4; doubleAddition = true; print("Adding ${s[i]} ${s[i+1]} - 4"); }
      else if(s[i]+s[i+1] == "IX" ){ sum += 9; doubleAddition = true; print("Adding ${s[i]} ${s[i+1]} - 9"); }
      else if(s[i]+s[i+1] == "XL" ){ sum += 40; doubleAddition = true; print("Adding ${s[i]} ${s[i+1]} - 40"); }
      else if(s[i]+s[i+1] == "XC" ){ sum += 90; doubleAddition = true; print("Adding ${s[i]} ${s[i+1]} - 90"); }
      else if(s[i]+s[i+1] == "CD" ){ sum += 400; doubleAddition = true; print("Adding ${s[i]} ${s[i+1]} - 400"); }
      else if(s[i]+s[i+1] == "CM" ){ sum += 900; doubleAddition = true; print("Adding ${s[i]} ${s[i+1]} - 900"); }
      else {
        doubleAddition = false; 
        print("Adding ${s[i]} - ${getInt(s[i])}");
        sum += getInt(s[i]);
      }
      if(doubleAddition){
        i++; // jump to next to next index
      }
    }
    // check if sum was updated for 2 characters, then don't add last char again
    // only add when 2 char not satisfying the logic means last character was not added
    // hence adding s[i] , i.e last character
    
    print("s.lenght - ${len} - current i is $i");
    print("(i <= s.length - 1) -- ${(i <= len - 1)}");
    if(i <= len - 1 && i > 0){
      // if i == 0 means above loop didn't run and i is still 0, because given roman num is of single digit
      if(s[i-1]+s[i] != "IX"){ sum += getInt(s[i]); print("Adding ${s[i]} - ${getInt(s[i])}"); }
      else if(s[i-1]+s[i] != "XL"){ sum += getInt(s[i]); print("Adding ${s[i]} - ${getInt(s[i])}"); }
      else if(s[i-1]+s[i] != "XC"){ sum += getInt(s[i]); print("Adding ${s[i]} - ${getInt(s[i])}"); }
      else if(s[i-1]+s[i] != "CD"){ sum += getInt(s[i]); print("Adding ${s[i]} - ${getInt(s[i])}"); }
      else if(s[i-1]+s[i] != "CM"){ sum += getInt(s[i]); print("Adding ${s[i]} - ${getInt(s[i])}"); }
    }else if(i == 0){
      sum += getInt(s[0]); print("Adding Edge Case ${s[0]} - ${getInt(s[0])}"); 
    }
    print("final sum - $sum");
    return sum;
  }

  // Symbol       Value
  // I             1
  // V             5
  // X             10
  // L             50
  // C             100
  // D             500
  // M             1000
  int getInt(String c){
    if(c == "I"){ return 1; }
    else if(c == "V"){ return 5; }
    else if(c == "X"){ return 10; }
    else if(c == "L"){ return 50; }
    else if(c == "C"){ return 100; }
    else if(c == "D"){ return 500; }
    else if(c == "M"){ return 1000; }
    return 0;
  }
}



void main(){
  print(Solution().romanToInt("MCMXCIV"));
}