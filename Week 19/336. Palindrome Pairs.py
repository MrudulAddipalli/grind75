
# Solution - https://www.youtube.com/watch?v=SSq0xH51pZQ

from ast import List


class Solution:
    def palindromePairs(self, words: List[str]) -> List[List[int]]:

        def isPal(w: str, start: int, end: int):
            return True

        N = len(words)
        ans = []

        # word index mapping
        lookup = {word: i for i, word in enumerate(words)}

        for i in range(N):
            word = words[i]
            currWordLen = len(word)

            if word == "":
                for j in range(N):
                    if i != j and isPal(words[j], 0, len(words[j])-1):
                        ans.append([i, j])
                        ans.append([j, i])
                    continue

            reverseWord = word[::-1]
            if reverseWord in lookup and i != lookup[reverseWord]:
                ans.append([i, lookup[reverseWord]])

            for k in range(1, currWordLen):
                if isPal(word, 0, k-1):
                    reversedSubWord = word[k:][::-1]
                    if reversedSubWord in lookup:
                        ans.append([lookup[reversedSubWord], i])

                if isPal(word, k, currWordLen-1):
                    reversedSubWord = word[:k][::-1]
                    if reversedSubWord in lookup:
                        ans.append([i, lookup[reversedSubWord]])

        return ans
