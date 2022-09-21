class Solution {
  bool isPalindrome(String s) {
    String input = "";
    int c = 0;
    for(int i=0;i<s.length;i++){
      c = s.codeUnitAt(i);
      print("char -${s[i]} code - $c");
      // http://facweb.cs.depaul.edu/sjost/it212/documents/ascii-pr.htm
      if((c >= 48 && c <= 57) || (c >= 65 && c <= 90) || (c>=97 && c<=122)){
        if(c >= 65 && c <= 90){
          c = c + 32; // upperCase to lowerCase 
          input += String.fromCharCodes([c]);
        }else{
          input += s[i];
        }
        print("input - $input");
      }
    }
    return  input == input.split("").reversed.join("") ? true : false;
  }
}
