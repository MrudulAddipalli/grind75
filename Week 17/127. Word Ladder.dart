// Solution - https://www.youtube.com/watch?v=nVH5hyVSXa8 CodeBix

// Time - O(m^2 * n)
// Space - O(n)
// n - lenght of workList
// m - lenght of beginWord

// for Dart - Time Limit Exceeded
// for Java
// Time - 68%
// Space - 60%

class Solution {
  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  int ladderLength(String beginWord, String endWord, List<String> wordList) {
    // base case
    if (!wordList.contains(endWord)) return 0;

    // create visited Map, filled default value as false for each word
    Map<String, bool> visited = {};
    for (String word in wordList) {
      visited[word] = false;
    }

    // for BFS Approach
    List<String> queue = [];
    // add beginWord in queue
    queue.add(beginWord);
    // mark work as visited in visited Map
    visited[beginWord] = true;

    int level = 1;

    void addAdjacentWordsInQueue(String currentWord) {
      // find all possible words we can make from currentWord by replacing single position
      for (int position = 0; position < currentWord.length; position++) {
        for (int alphabet = 0; alphabet < 26; alphabet++) {
          // update single position with new character
          // create character from int [ small 'a' is 97 and 'A' is 65 ], we need small char
          String replaceCharacter = String.fromCharCode(alphabet + 97);
          // since strings are immutable we cannot update string
          // currentWord[position] = replaceCharacter;
          String tempWord =
              replaceCharAt(currentWord, position, replaceCharacter);
          // now this tempWord should not be visited and should be in given wordList
          if (wordList.contains(tempWord) && (visited[tempWord] == false)) {
            queue.add(tempWord);
            visited[tempWord] = true;
          }
        }
      }
    }

    // Main Logic
    while (queue.isNotEmpty) {
      int size = queue.length;
      for (int i = 0; i < size; i++) {
        String currentWord = queue.removeAt(0);
        if (currentWord == endWord) {
          return level;
        }
        addAdjacentWordsInQueue(currentWord);
      }
      level++;
    }

    return 0;
  }
}
