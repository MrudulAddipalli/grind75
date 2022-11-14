
// Solution - https://www.youtube.com/watch?v=fu2cD_6E8Hw


class TimeMap {
  late Map<String, List<Data>> timeMap;
  TimeMap() {
    timeMap = {};
  }

  // No Sorting required since --- All the timestamps timestamp of set are strictly increasing.
  // Time - O(1)
  void set(String key, String value, int timestamp) {
    if (timeMap[key] == null) {
      timeMap[key] = [];
    }
    timeMap[key]!.add(Data(value, timestamp));
  }

// ["set",             "set",            "get",     "get",      "get",      "get"]
// [["love","high",10],["love","low",20],["love",5],["love",15],["love",20],["love",25]]

  //                   out - ["low",    "high",     "low",       "low",      "low"]

  //                   exp - ["   ",    "high",     "high",       "low",     "low"]

  // Time - O(n)
  String get(String key, int timestamp) {
    List<Data>? allEntries = timeMap[key];
    if (allEntries == null) return "";

    // Main Trick reverse looping
    for (int i = allEntries.length - 1; i >= 0; i--) {
      Data data = allEntries[i];
      if (data.timeStamp <= timestamp) return data.value;
    }

    return "";
  }
}


class Data {
  String value;
  int timeStamp;
  Data(this.value, this.timeStamp);
}