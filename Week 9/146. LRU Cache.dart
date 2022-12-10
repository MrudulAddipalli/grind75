// Explaination - https://www.youtube.com/watch?v=xDEuM5qa0zg
// Solution - https://www.youtube.com/watch?v=7ABFKPK2hD4&t=855s
// Solution video considers LRU as left, we consider as right,

// Note - below code, considers right as LRU, and left as Most Recently Used

// Algorithm for O(1) Time Complexity
// Initial Head And Tail will always be poining to Node with 0,0
// while put, if capacity is Not Full, then new element will added right after head
// while put, if capacity is Full, then node before tail will be deleted and new element will added right after head
// while put, if element already exist, then remove node before tail and right after head
// while get, if element is present then remove from DLL and put after head
// while get, if element is not present in hashmap then return -1
// Note: all delete and add in DDL will updated in HashMap everytime

class Node {
  int key, value;
  Node? prev, next;
  Node(this.key, this.value);
}

class LRUCache {
  int capacity = 0;
  Map<int, Node> cache = {};
  Node? left, right;

  LRUCache(int capacity) {
    this.capacity = capacity;
    left = right = Node(0, 0);
    left?.next = right;
    right?.prev = left;
  }

  void remove(Node? node) {
    // we don't right node here, because while adding node links are updated correctly
    // and new node is added from left node, hence LRU will always be on right
    // and current node always get linked to right node, which will be linked to last right node [ 0,0 ]  
    Node? prev = node?.prev;
    Node? next = node?.next;
    prev?.next = next;
    node?.prev = prev;
  }

  void insert(Node? node) {
    Node? prev = left?.prev;
    Node? next = left;
    prev?.next = next?.prev = node;
    node?.next = next;
    node?.prev = prev;
  }

  int get(int key) {
    if (cache.containsKey(key)) {
      Node node = cache[key]!;
      // remove from right
      remove(node);
      // inser from left
      insert(node);
      return node.value;
    }
    return -1;
  }

  void put(int key, int value) {
    // remove already existing node
    if (cache.containsKey(key)) {
      Node node = cache[key]!;
      // remove from right
      remove(node);
    }

    // update cache and new new node in DLL
    Node newNode = Node(key, value);
    cache[key] = newNode;
    // insert from left
    insert(newNode);

    // if capacity is exceeding, remove LRU , which node before tail node
    if (cache.length > capacity) {
      Node? lru = right?.prev;
      remove(lru);
      cache.remove(lru?.key);
    }
  }
}
