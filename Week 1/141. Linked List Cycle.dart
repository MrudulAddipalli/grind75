// Runtime: 0 ms, faster than 100.00% of Java online submissions for Linked List Cycle.
// Memory Usage: 45 MB, less than 83.62% of Java online submissions for Linked List Cycle.

// Floyds Cycle Detection Algorithm 
import '../helper_data_structures.dart/linked_list_base.dart';
class Solution {
  bool hasCycle(ListNode? head) {
    ListNode? slow = head, fast = head;
    while (slow != null && fast != null && fast.next != null) {
      slow = slow.next;
      fast = fast.next?.next;
      if (slow == fast) {
        // means cycle found
        // and if fast becomes null means cycle not found hence return false as default;
        return true;
      }
    }
    return false;
  }
}
