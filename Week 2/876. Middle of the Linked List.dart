
class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

// Solution 1 [ Naive]
// convert list to array
// find middle index using lenght()
// return arr[mid]  

// Solution 2 - similar to finding cycle in linked list
// Runtime: 431 ms, faster than 57.28% of Dart online submissions for Middle of the Linked List.
// Memory Usage: 140.1 MB, less than 99.03% of Dart online submissions for Middle of the Linked List.

class Solution {
  ListNode? middleNode(ListNode? head) {
    ListNode? slow = head, fast = head;
    while (slow != null && fast != null && fast.next != null) {
      slow = slow.next;
      // fast will reach the end faster when slow is in between the linked list
      // hence returing slow pointer which points to middle of linked list
      fast = fast.next?.next;
    }
    return slow;
  }
}