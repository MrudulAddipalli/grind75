// Naive Approach
// Convert Linked List to List
// keep 2 pointers left = 0 , right = len - 1
// create new array
// start for loop for i = 0 to (len/2)- 1
// add arr[left] and arr[right] to new array
// lastly convert array to linked list

// But in above solution we are using extra data structure and also changing form of original data structure
// Note : You may not modify the values in the list's nodes. Only nodes themselves may be changed.



// Solution - https://www.youtube.com/watch?v=L0SZnoiS_eM - Codebix
// Time - O(n) - 100%
// Space - O(n) - 100%


import '../helper_data_structures.dart/linked_list_base.dart';

class Solution {
  void reorderList(ListNode? head) {
    // base case
    if (head == null || head.next == null) return;

    ListNode? prev = head;
    ListNode? slow = head;
    ListNode? fast = head;

    // finding middle pointer to split into 2 lists
    while (slow != null && fast != null && fast.next != null) {
      prev = slow;
      slow = slow.next;
      fast = fast.next?.next;
    }

    // create 2 list, mark list 1 end node to point null
    prev?.next = null;
    ListNode? l1 = head;
    ListNode? l2 = reverse(slow);
    merge(l1, l2);
  }

  ListNode? reverse(ListNode? l2) {
    if (l2 == null) return null;
    ListNode? prev = null;
    ListNode? curr = l2;
    ListNode? next = l2.next;
    while (curr != null) {
      next = curr.next;
      curr.next = prev;
      prev = curr;
      curr = next;
    }
    return prev;
  }

  void merge(ListNode? l1, ListNode? l2) {
    while (l2 != null) {
      ListNode? next = l1?.next;
      l1?.next = l2;
      l1 = l2;
      l2 = next;
    }
  }
}
