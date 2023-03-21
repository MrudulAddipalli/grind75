

// Solution - https://www.youtube.com/watch?v=DfljaUwZsOk&t=505s

// All Approaches - https://www.youtube.com/watch?v=LiSdD3ljCIE

//// Algo:
//// Pop front elements if it out of window size
//// Maintain elements in Desc order - by removing elements in queue whose value is less then current index value
//// Push element as end of the list
//// Include maximum of current window - it will always be first element of the queue - why because in step 2 we remove all small values and in step 1 we remove all out of window elements, but only consider it if the window size if proper
class Pair<T1,T2>{
  T1 value;
  T1 index;
  Pair({required this.value,required this.index,});
}

class Solution {
  List<int> maxSlidingWindow(List<int> nums, int k) {
    List<int> output = [];
    // queue contains index of numbers from nums list
    // Monotonically Decreasing Queue
    List<Pair<int,int>> queue = [];
    for(int index = 0; index< nums.length;index++){


      // step 1: pop front elements if it out of window size
      if(queue.isNotEmpty && queue.first.index <= (index-k)){
        queue.removeAt(0);
      }

      // step 2: Maintain elements in Desc order
      while(queue.isNotEmpty && queue.last.value < nums[index]){
        queue.removeLast();
      }

      // step 3: Push element as end of the list
      queue.add(Pair(value:nums[index],index: index));

      // step 4: Include maximum of current window
      // checking if window size is proper to consider it max element of the current window
      if(index >= k-1){
        output.add(queue.first.value);
      }
    }
    return output;
  }
}
