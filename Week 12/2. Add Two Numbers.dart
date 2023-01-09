import '../helper_data_structures.dart/linked_list_base.dart';

// You are given two non-empty linked lists representing two non-negative integers.
// The digits are stored in "reverse order", and each of their nodes contains a single digit.
// Add the two numbers and return the sum as a linked list.
// You may assume the two numbers do not contain any leading zero, except the number 0 itself.
// Note : It is guaranteed that the list represents a number that does not have leading zeros.
// means 1 will not be written as 01

// Solution - https://www.youtube.com/watch?v=wgFPrzTjm7s
// Time - O(n), n - lenght of longest linked list
// Space - O(1)

// Time - 98.5%
// Space - 17.7%

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode dummy = ListNode(0);
    ListNode curr = dummy;

    int carry = 0;
    while (l1 != null || l2 != null || carry != 0) {
      int val1 = l1?.val ?? 0;
      int val2 = l2?.val ?? 0;

      // new digit
      int val = val1 + val2 + carry;
      // updating carry
      carry = val ~/ 10;
      // storing 1's digit
      val = val % 10;
      curr.next = ListNode(val % 10);

      // update pointers
      curr = curr.next!;
      l1 = l1?.next;
      l2 = l2?.next;
    }

    return dummy.next;
  }
}
