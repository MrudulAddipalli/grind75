// Time - // this will be O(1) constant time
// Space O(n)

// Runtime: 514 ms, faster than 88.89% of Dart online submissions for Min Stack.
// Memory Usage: 153.3 MB, less than 33.33% of Dart online submissions for Min Stack.

// Solution - https://www.youtube.com/watch?v=qkLl7nAwDPo

class MinStack {
  late List<int> stack;
  late List<int> minstack;
  MinStack() {
    stack = [];
    minstack = [];
  }

  void push(int val) {
    stack.add(val);
    // for min stack
    // minStack.last will have the latest min value
    int last = minstack.length > 0 ?  minstack.last : val;
    val = min(val,last);
    minstack.add(val);
  }

  int min(int a, int b) => a>b ? b : a;

  void pop() {
    if (stack.length > 0) stack.removeLast();
    // for min stack
    if (minstack.length > 0) minstack.removeLast();
  }

  int top() {
    if (stack.length > 0) return stack.last;
    return -1;
  }

  int getMin() {
    // this will be O(1) constant time
    if (minstack.length > 0) return minstack.last;
    return -1;
  }
}
