import '../helper_data_structures.dart/linked_list_base.dart';


// Noob Approach

// Better Approach - Solution - https://www.youtube.com/watch?v=XIdigk956u0
class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    List<int> mergedList = [
      ...linkedListToList(list1),
      ...linkedListToList(list2)
    ];
    mergedList.sort();
    return listToLinkedList(mergedList);
  }

  List<int> linkedListToList(ListNode? node) {
    List<int> list = [];
    while (node != null) {
      list.add(node.val);
      node = node.next;
    }
    return list;
  }

  ListNode? listToLinkedList(List<int> list) {
    LinkedList list1 = LinkedList();
    for (int i = 0; i < list.length; i++) {
      list1.add(list[i]);
    }
    return list1.node;
  }
}

void main() {
  Solution sol = Solution();

  LinkedList list1 = LinkedList();
  list1.add(1);
  list1.add(3);
  list1.add(5);

  LinkedList list2 = LinkedList();
  list2.add(2);
  list2.add(4);
  list2.add(6);

  ListNode? mergedNode = sol.mergeTwoLists(list1.node, list2.node);
  LinkedList list3 = LinkedList();
  list3.copy(mergedNode);
  print("\n\n\nPrinting Elements Of List");
  list3.log();
}
