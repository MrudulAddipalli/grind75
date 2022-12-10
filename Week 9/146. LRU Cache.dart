// Explaination - https://www.youtube.com/watch?v=xDEuM5qa0zg
// Solution - https://www.youtube.com/watch?v=7ABFKPK2hD4&t=855s
// Solution video considers LRU as head, we consider as tail,

// Note - below code, considers tail as LRU, and head as Most Recently Used

// Algorithm for O(1) Time Complexity
// Initial Head And Tail will always be poining to Node with 0,0
// while put, if capacity is Not Full, then new element will added tail after head
// while put, if capacity is Full, then node before tail will be deleted and new element will added tail after head
// while put, if element already exist, then remove node before tail and tail after head
// while get, if element is present then remove from DLL and put after head
// while get, if element is not present in hashmap then return -1
// Note: all delete and add in DDL will updated in HashMap everytime

// Time - 84.62%
// Memory - 100%

class Node {
  int key, value;
  Node? prev, next;
  Node(this.key, this.value);
}

class LRUCache {
  int capacity = 0;
  Map<int, Node> cache = {};
  Node head = new Node(0, 0);
  Node tail = new Node(0, 0);

  LRUCache(int capacity) {
    this.capacity = capacity;
    this.head.next = this.tail;
    this.tail.prev = this.head;
  }

  void remove(Node? node) {
    // remove from map
    this.cache.remove(node?.key);
    node?.prev?.next = node.next;
    node?.next?.prev = node.prev;
  }

  void insert(Node? node) {
    if (node != null) {
      this.cache[node.key] = node;
      Node? headNext = this.head.next;
      this.head.next = node;
      node.next = headNext;
      headNext?.prev = node;
      node.prev = head;
    }
  }

  int get(int key) {
    if (this.cache.containsKey(key)) {
      Node node = this.cache[key]!;
      // remove from tail
      this.remove(node);
      // insert from head
      this.insert(node);
      return node.value;
    }
    return -1;
  }

  void put(int key, int value) {
    // remove already existing node
    if (this.cache.containsKey(key)) {
      // remove from tail
      this.remove(this.cache[key]);
    }

    // if capacity is equal [ means cannot add new node until we have space ],
    // remove LRU , which node before tail node
    if (this.cache.keys.length == capacity) {
      this.remove(this.tail.prev);
    }
    // insert from head
    this.insert(new Node(key, value));
  }
}
