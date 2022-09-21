// Hint 1 - Use a stack of characters.
// Hint 2 - When you encounter an opening bracket, push it to the top of the stack.
// Hint 3 - When you encounter a closing bracket, check if the top of the stack was the opening for it. If yes, pop it from the stack. Otherwise, return false.


class Solution {
  List<String> data = [];
  
  bool isValid(String s) {
      
      for(int i=0;i<s.length;i++){
        String currentString = s[i];
        if(currentString == "("){
          data.add(currentString);
        }else if(currentString == ")"){
          if(!remove("(")){
            return false;
          }
        }else if(currentString == "{"){
           data.add(currentString);
        }else if(currentString == "}"){
           if(!remove("{")){
            return false;
          }
        }else if(currentString == "["){
           data.add(currentString);
        }else if(currentString == "]"){
           if(!remove("[")){
            return false;
          }
        }
      }
    return data.length == 0 ? true:false;
  }
  
  bool remove(String char){
    if(data.length==0) return false;
    if(data.last == char){
      if(data.length!=0){
        data.removeLast();
        return true;
      }   
     }
    return false;
  }
}