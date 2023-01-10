
// Merge Sort Approach - https://www.youtube.com/watch?v=TGveA1oFhrc

import '../helper_data_structures.dart/linked_list_base.dart';

// Naive Approach
// Create List Of Node Values
// Sort List
// Create Linked List from sorted List

// Time - O(n logn) - 100% , nlogn because of sorting
// Space - O(n) - 100%

class Solution {
  ListNode? sortList(ListNode? head) {
    List<int> values = [];
    while (head != null) {
      values.add(head.val);
      head = head.next;
    }

    values.sort();
    
    ListNode? res;
    ListNode? curr = ListNode(0);
    res = curr;
    for (int val in values) {
      curr?.next = ListNode(val);
      curr = curr?.next;
    }
    return res.next;
  }
}
