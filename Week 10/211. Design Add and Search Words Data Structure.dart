// Solution - https://www.youtube.com/watch?v=BTf05gs_8iU 

import '../Week 5/208. Implement Trie (Prefix Tree).dart';
class WordDictionary {
  late TrieNode root;
  WordDictionary() {
    root = TrieNode();
  }

  void addWord(String word) {
    TrieNode curr = this.root;
    for (int i = 0; i < word.length; i++) {
      if (!curr.childrens.containsKey(word[i])) {
        curr.childrens[word[i]] = TrieNode();
      }
      curr = curr.childrens[word[i]]!;
    }
    curr.endOfString = true;
  }

  bool search(String word) {

    // inner function
    bool dfs(int j, TrieNode curr) {
      for (int i = j; i < word.length; i++) {
        if (word[i] == ".") {
          // recursive main logic
          for (TrieNode child in curr.childrens.values) {
            if (dfs(i + 1, child)) {
              // Optimisation
              return true;
            }
          }
          // no child available
          return false;
        } else {
          if (!curr.childrens.containsKey(word[i])) {
            return false;
          }
          curr = curr.childrens[word[i]]!;
        }
      }
      return curr.endOfString;
    }

    return dfs(0, this.root);
  }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * WordDictionary obj = WordDictionary();
 * obj.addWord(word);
 * bool param2 = obj.search(word);
 */