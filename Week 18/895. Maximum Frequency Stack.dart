
// Solution - O(n) - https://www.youtube.com/watch?v=Z6idIicFDOE

// My Approach - Time Limit Exceeded -  31 / 38 testcases passed
// Time - O(n^2)
// Space - O(n)

class FreqStack {
  List<int> stack = [];

  FreqStack() {}

  int max(int a, int b) => a > b ? a : b;

  void push(int val) {
    stack.add(val);
    print("current stack after push - $stack");
  }

  int pop() {
    // find most repeated
    Map<int, int> occurences = {};
    for (int num in stack) {
      occurences[num] = (occurences[num] ?? 0) + 1;
    }
    // find max val as repeatation
    int maxRepeatCount = -1;

    for (int val in occurences.values) {
      if (maxRepeatCount < val) maxRepeatCount = val;
    }
    List<int> maxRepeatNumbers = [];

    // find all numbers which has equal occurences
    occurences.forEach((num, repeatCount) {
      if (maxRepeatCount == repeatCount) maxRepeatNumbers.add(num);
      
    });

    // optimisation
    if(maxRepeatNumbers.length == 1){
      int indexInStack = stack.lastIndexOf(maxRepeatNumbers.first);
      return stack.removeAt(indexInStack); 
    }

    print(
        'max repeat numbers which has repeat count $maxRepeatCount is \n $maxRepeatNumbers');
    // Stack is LIFO, pop is done on last element
    for (int i = stack.length - 1; i >= 0; i--) {
      if (maxRepeatNumbers.contains(stack[i])) return stack.removeAt(i);
    }
    return stack.removeLast();
  }
}
