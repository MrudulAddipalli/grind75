
// Monotinic Stack
// Solution - https://www.youtube.com/watch?v=cTBiBSnjO3c


// Time Limit Exceeded
// Time - O(n^2)
// Space - O(1) - output array not considered for space

class Solution {
  List<int> dailyTemperatures(List<int> temperatures) {
    List<int> nextHighestTemperature = List.filled(temperatures.length, 0);

    int getNextHighestTemperatureIndex(int index) {
      int currentTemp = temperatures[index];
      int count = 0;
      for (int i = index + 1; i < temperatures.length; i++) {
        count++;
        if (currentTemp < temperatures[i]) {
          return count;
        }
      }
      return 0;
    }

    for (int i = 0; i < temperatures.length; i++) {
      nextHighestTemperature[i] = getNextHighestTemperatureIndex(i);
    }

    return nextHighestTemperature;
  }
}

void main() {
  print("Result - ${Solution().dailyTemperatures([
        73,
        74,
        75,
        71,
        69,
        72,
        76,
        73
      ])}");
}
