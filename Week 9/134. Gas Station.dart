// Input: gas = [1,2,3,4,5], cost = [3,4,5,1,2]
// Output: 3
// Explanation:
// Start at station 3 (index 3) and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
// Travel to station 4. Your tank = 4 - 1 + 5 = 8
// Travel to station 0. Your tank = 8 - 2 + 1 = 7
// Travel to station 1. Your tank = 7 - 3 + 2 = 6
// Travel to station 2. Your tank = 6 - 4 + 3 = 5
// Travel to station 3. The cost is 5. Your gas is just enough to travel back to station 3.
// Therefore, return 3 as the starting index.

// 2 - 4 + 3 = 1
// 1 - 5 + 4 = 0
// 0 - 1 + 5 = 4
// 4 - 2 + 1 = 3
// 3 - 3 + 2 = 2

class Solution {
  int canCompleteCircuit(List<int> gas, List<int> cost) {
    int totalAvailableStations = gas.length;

    for (int start = 0; start < totalAvailableStations; start++) {
      print("\nstarting from station $start");

      int stationsVisited = 0;
      int currentStationIndex = start;
      int tank = gas[start];

      while (stationsVisited < totalAvailableStations) {
        print("currentStationIndex - $currentStationIndex, initial tank - $tank ");
        print("tank = $tank - ${cost[currentStationIndex]} --- ${tank - cost[currentStationIndex]}");
        // first findind cost to reach next station
        tank = tank - cost[currentStationIndex];
        
        // then checking if cannot reach
        // Main Logic
        if (tank < 0) {
          print("cannot reach next station");
          break;
        } 
        // if reaching next station by making entire tank empty, means either car
        // has reached start or in between circuit somewhere in reaching next station
        // tank was empty 

        // hence also checking if that's the startstation 
        else if (tank == 0 && stationsVisited == totalAvailableStations - 1) {
          print("Tank Becoming Zero Means We can reach start by doing circuit");
          return start;
        }

        // handling index cycle to make car reach all station in circular order
        if (currentStationIndex + 1 > totalAvailableStations - 1) { currentStationIndex = 0; }
        else { currentStationIndex++; }
        
        // now once car reaches next station with tank >= 0 we fill the tank with gas[i] 
        print("tank = $tank + ${gas[currentStationIndex]} --- ${tank + gas[currentStationIndex]}");
        tank = tank + gas[currentStationIndex];

        // increamenting stations reached
        stationsVisited++;
        print("current tank - $tank");
      }

    }
    return -1;
  }
}

void main() {
  // print("Result - ${Solution().rob([2, 7, 9, 3, 1])}");
  print("Result - ${Solution().canCompleteCircuit([
        1,
        2,
        3,
        4,
        5
      ], [
        3,
        4,
        5,
        1,
        2
      ])}");
}
