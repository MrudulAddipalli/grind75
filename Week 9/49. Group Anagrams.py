
# Solution - https://www.youtube.com/watch?v=vzdNOK2oB2E

# Time - O(m x n)
# Space - O(m x n)
# m - number of strings in array
# n - average lenght of string in strs

# Different Approach - while looping strs, sort each string and use same string as key and add it in map value of list,
# sort will be xLogx - where x is ranging from 1-26 [ a - z ascii ], hence sort is of constant time
# overvall time complexity will be O(m)
# Code - https://leetcode.com/problems/group-anagrams/solutions/2745976/group-anagrams-solution-by-dart/?languageTags=dart

# Different Approach - instead of array , we can have HashMap for char count, but after finding char count,
# we have to sort keys and then convert it to String to use it as Key for result map - which will increase time complexity by O(nLogn), where n is keys lenght in map, 
# total time complexity will be O(m x [n + xLogx] ), x will be max 26, hence it is constant - total will be O(m x n)

# hence count array approach is easy
# Same code in dart will the difference of tuple, we have to convert array to string and use it as key - will have O(26) Time Complexity


from ast import List
from collections import defaultdict

class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        res = defaultdict(list)  # mapping count array as key to list of anagram as values

        for s in strs:
            count = [0] * 26 # a - z

            # counting count of each character and sorting in count array
            for c in s:
                count[ord(c) - ord("a")] += 1

            # using count array as Key for res map, and storing the Anagram str in res value which is a list  
            res[tuple(count)].append(s)
        
        # .values() will give list of values [ our values are list ]
        return res.values()