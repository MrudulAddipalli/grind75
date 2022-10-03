import '../../helper_data_structures.dart/linked_list_base.dart';

class Solution {
  ListNode? reverseList(ListNode? head) {
    List<int> rev = [];
    while (head != null) {
      rev.add(head.val);
      head = head.next;
    }
    LinkedList? reverseLinkedList = LinkedList();
    for (int i in rev.reversed) {
      reverseLinkedList.add(i);
    }
    return reverseLinkedList.node;
  }
}

void main() {
  Solution sol = Solution();
  LinkedList? node = LinkedList();
  node.add(1);
  node.add(2);
  node.add(3);
  node.add(4);
  node.add(5);
  node.copy(sol.reverseList(node.node));
  node.log();
}
