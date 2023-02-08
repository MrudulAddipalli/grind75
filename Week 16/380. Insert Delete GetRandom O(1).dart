

// Solution - https://www.youtube.com/watch?v=j4KwhBziOpg 

import 'dart:math';

class RandomizedSet {
  Map<int, int> numberIndexMap = {};
  List<int> numList = [];

  RandomizedSet() {}

  bool insert(int val) {
    bool notExist = !numList.contains(val);
    if (notExist) {
      // map stores list position index
      numberIndexMap[val] = numList.length;
      numList.add(val);
    }
    return notExist;
  }

  bool remove(int val) {
    bool exist = numList.contains(val);
    if (exist) {
      // remove element from map
      // remove element from list
      // update last element index mapping in map
      // shift last element to the place where current removal val is situated
      int currentValueIndex = numberIndexMap[val]!;
      int lastVal = numList.elementAt(numList.length - 1);
      numList[currentValueIndex] = lastVal;
      numList.removeLast();
      numberIndexMap[lastVal] = currentValueIndex;
      numberIndexMap.remove(val);
    }
    return exist;
  }

  int getRandom() {
    int min = 0;
    int max = numList.length - 1;
    int randomIndex = min + Random().nextInt(max - min);
    return numList[randomIndex];
  }
}
