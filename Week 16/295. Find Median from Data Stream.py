
# My Approach
# Sort Array Each Time We addNum
# Time - O(nlogn) - sorting

# Solution - https://www.youtube.com/watch?v=itmhHWaHupI

import heapq

class MedianFinder:
    
    def __init__(self):
        # max heap
        self.smallMaxHeap = []
        # min heap
        self.largeMinHeap = []

    def addNum(self, num: int) -> None:
        heapq.heappush(self.smallMaxHeap, -1 * num)

        # make sure that each number in smallMaxHeap is <= all number in largeMinHeap
        # why to check this? - coz we directly add number in smallMaxHeap
        if (
            # checking if smallMaxHeap and largeMinHeap are not empty
            self.smallMaxHeap and self.largeMinHeap and
            # means largest number in smallMaxHeap is larger then smallest number in largeMinHeap
                (-1 * self.smallMaxHeap[0]) > self.largeMinHeap[0]):
            # remove largest from smallMaxHeap
            val = -1 * heapq.heappop(self.smallMaxHeap)
            # add it into largeMinHeap
            heapq.heappush(self.largeMinHeap, val)

        # maintain size of smallMaxHeap And largeMinHeap
        # difference of size of both heaps will increase by 1 anytime
        # coz we are moving data from them into respective heap below

        # smallMaxHeap size is bigger
        if (len(self.smallMaxHeap) > len(self.largeMinHeap) + 1):
            # remove largest from smallMaxHeap
            val = -1 * heapq.heappop(self.smallMaxHeap)
            # add it into largeMinHeap
            heapq.heappush(self.largeMinHeap, val)

        # largeMinHeap size is bigger
        if (len(self.largeMinHeap) > len(self.smallMaxHeap) + 1):
            # remove largest from largeMinHeap
            val = heapq.heappop(self.largeMinHeap)
            # add it into smallMaxHeap
            heapq.heappush(self.smallMaxHeap, -1 * val)

    def findMedian(self) -> float:
        # if smallHeap is largest means our no. of data is odd, we can take middle number
        # which will be in any of the heap smallMaxHeap or largeMinHeap
        if len(self.smallMaxHeap) > len(self.largeMinHeap):
            return -1 * self.smallMaxHeap[0]
        if len(self.largeMinHeap) > len(self.smallMaxHeap):
            return self.largeMinHeap[0]

        # means our no. of data in both heaps are equal , means we have equal no of data
        # find median of largest from smallMaxHeap and smalled from largeMinHeap
        return ((-1 * self.smallMaxHeap[0]) + (self.largeMinHeap[0])) / 2
