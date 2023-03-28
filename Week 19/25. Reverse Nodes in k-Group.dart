
// Solution - https://www.youtube.com/watch?v=1UOPsfP85V4

// Time - 83.33%
// Space - 100%

import '../helper_data_structures.dart/linked_list_base.dart';
class Solution {
  ListNode? reverseKGroup(ListNode? head, int k) {
    ListNode? dummy = ListNode(-1);
    dummy.next = head;
    ListNode? groupPrev = dummy;
    

    while (true) {
      
      
    print("\n here groupPrev - ${groupPrev?.val}\n\n\n");
      
      ListNode? kthNode = getKth(groupPrev, k);
      if (kthNode == null) { print("kthNode is null"); break;}
      print("kthNode - ${kthNode.val}");

      ListNode? groupNext = kthNode.next;
      print("groupNext - ${groupNext?.val}");
      
      
      print("before reverse");
      dummy.printConnectedNodes();

      // reverse linked list from groupPrev.next to kthNode
      // using kthNode.next as prev because prev will be our first node after reverse
      // and groupPrev.next will be our last node after reverse
      ListNode? curr = groupPrev?.next, prev = kthNode.next;
      
      print("before reverse, curr -> ${curr?.val}, prev -> ${prev?.val} ");

      // reverse LL
      while (curr != groupNext) {
        ListNode? temp = curr?.next;
        curr?.next = prev;
        prev = curr;
        curr = temp;
      }
      print("before reverse, curr -> ${curr?.val}, prev -> ${prev?.val}");
      
      // IMP: for given LL -1 [dummy/groupPrev] -> 1 -> 2 -> 3 -> 4   
      // after reverse  2 pointing to 1 and 1 pointing to 3
      // dummy[-1] -> 1 -> 3 -> 4
      // 2 -> 1 -> 3 -> 4
      // groupPrev will remain unchanged and groupPrev.next will still point to 1
      
         
      // IMP: we want -1 -> 2 -> 1 -> 3 -> 4 
      
      
      // here we need to update dummy node or groupPrev to point kthNode [ 2 ],
      // groupPrev is pointing to 1 [ first node ] of given Linked list, 
      // after reverse also groupPrev will remain unchanged and groupPrev.next will still point to 1
      ListNode? temp = groupPrev?.next;
      groupPrev?.next = kthNode; // now groupPrev?.next points to 2
      // -1 > 2 -> 1 -> 3 -> 4
      groupPrev = temp; // groupPrev will be 1,
      
      // now
      // dummy -> 2 -> 1 -> 3 -> 4
      // groupPrev is 1 which 2nd Node in the reverse LL
    }

    return dummy.next;
  }

  ListNode? getKth(ListNode? curr, int k) {
    while (curr != null && k > 0) {
      curr = curr.next;
      k--;
    }
    return curr;
  }
}
