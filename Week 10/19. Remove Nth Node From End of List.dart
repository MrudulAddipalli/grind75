import '../helper_data_structures.dart/linked_list_base.dart';


// Solution - https://www.youtube.com/watch?v=XVuQxVej6y8


// Approach 1 --> Reverse Linked List, from head of reversed linked list use counter till you reach the specific node
// from head and remove it, after that continue iteration and reach last node [ which will be our head ]

// Approch 2 --> Iterate and Reach last node, use counter and reach last node [ which our head ]
// and while reaching use counter and remove element

// Approach 3 --> Floyds Cycle Detection Algorithm, use left and right point,
// and distance of left and right pointer will be N, iterate till right is null,
// bu moving left and right pointer by next
// when right reaches null means right is now at nect node of last node
// here when right reached null, our left will point to Nth Element in the LL
// delete that node at left pointer

// Solution Based On Approach 3
class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    // we added dummy cause we need to place left pointer on N-1 th node
    // so that we can do delete Nth node easily by left?.next = left.next?.next;
    ListNode dummyNode = ListNode(0, head);
    ListNode? left = dummyNode;

    // right should point to Node with N distance from left
    // ListNode right = head + N;

    ListNode? right = head;
    while (n > 0 && right != null) {
      right = right.next;
      n--;
    }

    // Main Algo
    while (left != null && right != null) {
      left = left.next;
      right = right.next;
    }

    // remove left node which is now pointing to Nth position
    left?.next = left.next?.next;

    return dummyNode.next;
  }
}
