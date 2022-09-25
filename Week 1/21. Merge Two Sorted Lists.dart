// Maintain Seperate Linked List for add delete, etc

class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

class LinkedList {
  ListNode? node;

  void add(int data) {
    if (node == null || node?.val == null) {
      print("Adding $data as node is empty");
      node = ListNode(data);
      return;
    } else {
      // This temp is important to have correct list
      ListNode? temp = node;
      while (temp?.next != null) {
        temp = temp?.next;
      }
      temp?.next = ListNode(data);
      print("Adding At End - $data, list.val -${temp?.next?.val}");
    }
  }

  void log() {
    if (node == null || node?.val == null) {
      print("List is empty");
      return;
    } else {
      ListNode? currentNode = node;
      while (currentNode != null) {
        print("Element = ${currentNode.val}");
        currentNode = currentNode.next;
      }
    }
  }

  void copy(ListNode? copy) {
    node = copy;
  }
}

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
