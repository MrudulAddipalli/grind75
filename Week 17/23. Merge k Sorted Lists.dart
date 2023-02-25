import '../helper_data_structures.dart/linked_list_base.dart';

// My Approach
// Create Single List From All Linked List
// Sort combined list
// convert list to linked list

// Time  - ( M Log M ) - for sorting
// Space - O(kxn)
// M - k x n
// k - no. of linked lists
// n - no. of nodes in each linked list

// Solution - https://www.youtube.com/watch?v=q5a5OiGbT6Q

class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {
    if (lists.isEmpty) return null;

    // why one coz after merging all linked list we will end up with only 1 list
    while (lists.length > 1) {
      List<ListNode?> mergedList = [];

      // merge linked list of 2 pairs
      for (int i = 0; i < lists.length; i = i + 2) {
        ListNode? list1 = lists[i];
        // here i+1 may get out of bound
        ListNode? list2;
        if (i + 1 < lists.length) {
          list2 = lists[i + 1];
        }

        mergedList.add(merge2SortedList(list1, list2));
      }

      lists = mergedList;
    }

    // sincw we update our lists with mergedList,
    // at end we will end up with only 1 final merged sorted list
    return lists[0];
  }

  ListNode? merge2SortedList(ListNode? list1, ListNode? list2) {
    ListNode? dummy = ListNode(-1);
    ListNode? head = dummy;

    while (list1 != null && list2 != null) {
      if (list1.val < list2.val) {
        // add list1 node
        head?.next = list1;
        list1 = list1.next;
      } else {
        // add list2 node
        head?.next = list2;
        list2 = list2.next;
      }
      // update head as we already added smallest node in head
      head = head?.next;
    }

    // now at the end , head will have either node of largest linked list or it might be null

    // add remaining nodes of either lists
    if (list1 != null) {
      head?.next = list1;
    } else if (list2 != null) {
      head?.next = list2;
    }

    return dummy.next;
  }
}
