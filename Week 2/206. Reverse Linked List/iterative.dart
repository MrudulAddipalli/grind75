
// Runtime: 684 ms, faster than 5.88% of Dart online submissions for Reverse Linked List.
// Memory Usage: 152.3 MB, less than 19.12% of Dart online submissions for Reverse Linked List.

// when moved ListNode? next in while loop

// Runtime: 627 ms, faster than 10.29% of Dart online submissions for Reverse Linked List.
// Memory Usage: 142.4 MB, less than 70.59% of Dart online submissions for Reverse Linked List.

import '../../helper_data_structures.dart/linked_list_base.dart';

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
    // curr will point to null, and prev will point to head
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
