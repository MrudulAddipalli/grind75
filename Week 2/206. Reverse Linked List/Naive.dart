class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val);
}

class LinkedList {
  ListNode? node;

  void add(int data) {
    if (node == null || node?.val == null) {
      node = ListNode(data);
      return;
    } else {
      // This temp is important to have correct list
      ListNode? temp = node;
      while (temp?.next != null) {
        temp = temp?.next;
      }
      temp?.next = ListNode(data);
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
  ListNode? reverseList(ListNode? head) {
    List<int> rev = [];
    while (head != null) {
      rev.add(head.val);
      head = head.next;
    }
    LinkedList? reverseLinkedList = LinkedList();
    for (int i in rev.reversed) {
      reverseLinkedList.add(i);
    }
    return reverseLinkedList.node;
  }
}

void main() {
  Solution sol = Solution();
  LinkedList? node = LinkedList();
  node.add(1);
  node.add(2);
  node.add(3);
  node.add(4);
  node.add(5);
  node.copy(sol.reverseList(node.node));
  node.log();
}
