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