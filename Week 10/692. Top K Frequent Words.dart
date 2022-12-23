// Solution - https://www.youtube.com/watch?v=cupg2TGIkyM

// Time complexity - O(nLogn) - for words iteratoin [ O(n) ] + sort array [ O(nLogn) ]
// Space complexity - O(n) - for map and res


// Constraints - Time should be O(nLogk)

class Solution {
  List<String> topKFrequent(List<String> words, int k) {
    Map<String, int> repeated = {};
    for (int i = 0; i < words.length; i++) {
      if (repeated.containsKey(words[i])) {
        repeated[words[i]] = repeated[words[i]]! + 1;
      } else {
        repeated[words[i]] = 1;
      }
    }
    List<String> res = [];

    // sort map with values with Lexicographical Order
    res = repeated.keys.toList(growable: false)
      ..sort((a, b) {
        int freq1 = repeated[a]!;
        int freq2 = repeated[b]!;
        if(freq1 == freq2) return b.compareTo(a);
        return freq1 - freq2;
      });

    // Constraints - Time should be O(nLogk)
    // to comply with this we need use priority queue [PQ] and control the res lenght
    // while comparing the words and frequency and then adding into PQ
    // because in priority queue we can add word in it with Time Complexity of O(nLogn)
    // and if we use "k" to determin whether to add the word in PQ or not, our Time Complexity Will come down
    // to O(nLogk)

    return res.reversed.toList().sublist(0, k);
  }
}
void main() {
    print("Result - ${Solution().topKFrequent(["leetcode","i","love","i","love","coding"],4)}");
}
