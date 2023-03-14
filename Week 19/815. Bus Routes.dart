
// Solution - https://www.youtube.com/watch?v=WhuiqhMXhxM

// Time Limit Exceeded

class Solution {
  int numBusesToDestination(List<List<int>> routes, int source, int target) {
    int level = 0;
    Map<int, List<int>> busStopsToBusNumberMap = {};

    for (int i = 0; i < routes.length; i++) {
      int busNumber = i;
      for (int j = 0; j < routes[busNumber].length; j++) {
        int busStop = routes[busNumber][j];
        List<int> busesThatStopAtThisBusStop =
            busStopsToBusNumberMap[busStop] ?? [];
        busesThatStopAtThisBusStop.add(busNumber);
        busStopsToBusNumberMap[busStop] = busesThatStopAtThisBusStop;
      }
    }

    List<int> routeQueue = [];
    Set<int> busRouteVisited = {};
    Set<int> busNumberVisited = {};

    routeQueue.add(source);
    busRouteVisited.add(source);

    while (routeQueue.isNotEmpty) {
      int len = routeQueue.length;
      for (int i = 0; i < len; i++) {
        int busStop = routeQueue.removeAt(0);

        // Main Check
        if (busStop == target) return level;

        // Add all routes of buses that stops at this busStop

        // first find buses that stops at this busStop, which we can get from busStopsToBusNumberMap
        List<int>? bussesThatStopAtThisBusStop =
            busStopsToBusNumberMap[busStop];

        // No buses available that stops at this busStop
        if (bussesThatStopAtThisBusStop == null) continue;

        for (int b = 0; b < bussesThatStopAtThisBusStop.length; b++) {
          int currentBus = bussesThatStopAtThisBusStop[b];

          // check if this currentBus is already visited then don't add,
          // and break for loop cause no more processing needed
          if (busNumberVisited.contains(currentBus)) continue;

          // add all routes which the currentBus goes to
          // get all routes from given routes data
          List<int> busThatStopsAtFollowingBusStops = routes[currentBus];
          for (int s = 0; s < busThatStopsAtFollowingBusStops.length; s++) {
            int busStop = busThatStopsAtFollowingBusStops[s];
            // check if this route is already visited then don't add
            // and break for loop cause no more processing needed
            if (busRouteVisited.contains(busStop)) continue;

            routeQueue.add(busStop);
            busRouteVisited.add(busStop);
          }

          // if we add this in line 49 then after first iteration it will not add remaining stops of that bus
          busNumberVisited.add(currentBus);
        }
      }

      // since 1 level of all routes are covered from source
      level++;
    }

    return -1;
  }
}
