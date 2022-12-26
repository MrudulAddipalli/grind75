
// Solution - https://www.youtube.com/watch?v=o811TZLAWOo

// Time - O(n)
// Scace - O(1) - no copy of List was made

import '../helper_data_structures.dart/linked_list_base.dart';

class Solution {
  ListNode? swapPairs(ListNode? head) {
    ListNode dummy = ListNode(0, head);
    ListNode prev = dummy;
    ListNode? curr = head;

    while (curr != null && curr.next != null) {
      // save pointers
      ListNode? nextPair = curr.next?.next;
      ListNode? second = curr.next;

      // reverse the pair
      second?.next = curr;
      curr.next = nextPair;
      prev.next = second;

      // update pointers
      prev = curr;
      curr = nextPair;
    }

    return dummy.next;
  }
}
