class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val);
}

class LinkedList {
  ListNode? node;

  void add(int data) {
    if (node == null || node?.val == null) {
      node = ListNode(data);
      return;
    } else {
      // This temp is important to have correct list
      ListNode? temp = node;
      while (temp?.next != null) {
        temp = temp?.next;
      }
      temp?.next = ListNode(data);
    }
  }

  void log() {
    if (node == null || node?.val == null) {
      print("List is empty");
      return;
    } else {
      ListNode? currentNode = node;
      while (currentNode != null) {
        print("Element = ${currentNode.val}");
        currentNode = currentNode.next;
      }
    }
  }

  void copy(ListNode? copy) {
    node = copy;
  }
}

// Runtime: 684 ms, faster than 5.88% of Dart online submissions for Reverse Linked List.
// Memory Usage: 152.3 MB, less than 19.12% of Dart online submissions for Reverse Linked List.

// when moved ListNode? next in while loop

// Runtime: 627 ms, faster than 10.29% of Dart online submissions for Reverse Linked List.
// Memory Usage: 142.4 MB, less than 70.59% of Dart online submissions for Reverse Linked List.

class Solution {
  ListNode? reverseList(ListNode? head) {
    ListNode? prev, curr = head, next;
    void Function() printIt = () {
      print("\n\n\n");
      print("prev - ${prev?.val}");
      print("curr - ${curr?.val}");
      print("curr.next - ${curr?.next?.val}\n\n\n");
    };

    printIt.call();
    print("Loop Start");
    while (curr != null) {
      next = curr.next;
      // Main logic
      curr.next = prev;
      prev = curr;
      curr = next;
      printIt.call();
    }
    return prev;
  }
}

void main() {
  Solution sol = Solution();
  LinkedList? node = LinkedList();
  node.add(1);
  node.add(3);
  node.add(7);
  node.add(0);
  node.add(2);
  node.copy(sol.reverseList(node.node));
  node.log();
}
