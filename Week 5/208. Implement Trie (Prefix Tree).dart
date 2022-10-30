
// Solution - https://www.youtube.com/watch?v=oobqoCJlHA0

class TrieNode {
  // Map is better for traversal which makes Trie - Prefix tree travesal more optimised than List,
  // if we used List then it will have O(n) time for traversal
  // Map has O(1) time for traversal
  Map<String, TrieNode> childrens = {};
  bool endOfString = false;
}

class Trie {
  late TrieNode root;

  Trie() {
    root = TrieNode();
  }

  void insert(String word) {
    TrieNode curr = this.root;
    for (int i = 0; i < word.length; i++) {
      if (!curr.childrens.containsKey(word[i])) {
        // create new node
        curr.childrens[word[i]] = TrieNode();
      }
      curr = curr.childrens[word[i]]!;
    }
    // curr will be pointing to end character
    curr.endOfString = true;
  }

  bool startsWith(String prefix) {
    TrieNode curr = this.root;
    for (int i = 0; i < prefix.length; i++) {
      if (!curr.childrens.containsKey(prefix[i])) {
        return false;
      }
      curr = curr.childrens[prefix[i]]!;
    }
    // if false not returned means char exists
    return true;
  }

  bool search(String word) {
    TrieNode curr = this.root;
    for (int i = 0; i < word.length; i++) {
      if (!curr.childrens.containsKey(word[i])) {
        return false;
      }
      curr = curr.childrens[word[i]]!;
    }
    // if false not returned means char exist
    // but we need to return true only if the char is endOfString
    // if we search for app, and trie as apple, then result is false
    return curr.endOfString;
  }
}
