// Initial Approach
// NOTE: The first node is considered odd, and the second node is even, and so on. [ value is not considered for even odd ]
// Store all even and odds in seperate list and create new Linked List with odd first and even later
// but this will have
// Time - O(n)
// Space - O(n)
//
// The given contraints are
// You must solve the problem in O(1) extra space complexity and O(n) time complexity.

// Approach 2
// Use 2 pointer for odd & even position
// point 1st node to 3rd node
// remove node at pointer 2 and place it at last
// so also maintain last node reference
// once node at pointer 2 is moved to end update last node reference
// make lastnode.next.next = null
// Solution - https://www.youtube.com/watch?v=YE9ggKeHeK0

import '../helper_data_structures.dart/linked_list_base.dart';

class Solution {
  ListNode? oddEvenList(ListNode? head) {
    if (head == null) return head;

    int count = 0;

    // finding end node
    ListNode? end = head;
    while (end?.next != null) {
      end = end?.next;
      count++;
    }

    // Even Odd List Length Handling
    count = (count % 2 == 1) ? (((count) ~/ 2) + 1) : ((count) ~/ 2);

    ListNode? temp = head;

    while (count-- != 0) {
      end?.next = temp?.next;
      temp?.next = temp.next?.next;
      end?.next?.next = null;
      temp = temp?.next;
      end = end?.next;
    }

    return head;
  }
}
