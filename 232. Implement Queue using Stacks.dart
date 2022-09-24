// Runtime: 475 ms, faster than 50.00% of Dart online submissions for Implement Queue using Stacks.
// Memory Usage: 140.2 MB, less than 90.00% of Dart online submissions for Implement Queue using Stacks.

class MyQueue {
  late List<int> queue;

  MyQueue() {
    queue = [];
  }

  void push(int x) {
    queue.add(x);
    printIt();
  }

  int pop() {
    if (queue.isNotEmpty) {
      int frontElement;
      frontElement = queue[0];
      queue.removeAt(0);
      print("Popping - $frontElement");
      return frontElement;
    }
    print("Nothing to pop");
    return -1;
  }

  int peek() {
    if (queue.isNotEmpty) {
      print("Peeking - ${queue[0]}");
      return queue[0];
    }
    print("Nothing to Peek");
    return -1;
  }

  bool empty() {
    print("empty() - ${queue.isEmpty}");
    return queue.isEmpty;
  }

  void printIt() {
    print("Current Queue");
    for (var e in queue) {
      print(e);
    }
  }
}

void main() {
  MyQueue queue = MyQueue();
  queue.push(10);
  queue.push(12);
  queue.push(14);
  queue.pop();
  queue.peek();
  queue.empty();
  queue.pop();
  queue.peek();
  queue.empty();
  queue.pop();
  queue.empty();
}
