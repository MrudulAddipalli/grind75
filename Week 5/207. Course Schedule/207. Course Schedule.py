# Solution - https: // www.youtube.com/watch?v = EgI5nU9etnU\
from calendar import c


class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        preMap = {i: [] for i in range(numCourses)}

        for crs, pre in prerequisites:
            preMap[crs].append(pre)

        visitedSet = set()

        def dfs(crs):
            if crs in visitedSet:
                return False

            if preMap[crs] == []:
                return True

            visitedSet.add(crs)

            for pre in preMap[crs]:
                if not dfs(pre):
                    return False

            visitedSet.remove(crs)
            preMap[crs] = []

            return True

        for crs in range(numCourses):
            if not dfs(crs):
                return False

        return True
