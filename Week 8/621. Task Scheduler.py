
# Solution - https://www.youtube.com/watch?v=s8p8ukTyA2I

# Runtime: 873 ms, faster than 68.73% of Python3 online submissions for Task Scheduler.
# Memory Usage: 14.5 MB, less than 42.15% of Python3 online submissions for Task Scheduler.

# Time - O(n), with heapify() - O(NlogN), but our N ranges from A-Z, hence due to constant time, final time complexity is O(n)
# Space - O(n)

from ast import List
from collections import Counter, deque
import heapq


class Solution:
    def leastInterval(self, tasks: List[str], n: int) -> int:
        # this will create Map with key as tasks[i] and value as 1 * repeatition
        count = Counter(tasks)
        # storing negation of each value of count Map 
        maxHeap = [ -cnt for cnt in count.values() ]
        # sorts in ascending order where most negative will be on left, pop will give most negative value
        # we are negative cause heapify() works in ascending order which is similar to minHeap [ python does not support maxHeap ]
        # hence we are negating values to gets bigger number in start in negative form
        heapq.heapify(maxHeap)

        time = 0
        q = deque() # contains pair of [ -cnt , idleTime ]

        # while maxHeap or q are not empty
        while maxHeap or q:
            time += 1
            # if maxHeap is not empty
            if maxHeap:
                # adding 1 because we we have negated count hence instead of reducing by 1
                # we add 1
                cnt = 1 + heapq.heappop(maxHeap) 
                if cnt:
                    q.append([ cnt , time + n ])
            # if queue not empty and tast in queue, has idleTime similar to current time
            # meaning this tast in queue is ready to get executed
            # hence adding task in maxHeap
            if q and q[0][1] == time:
                heapq.heappush(maxHeap,q.popleft()[0])
        return time
