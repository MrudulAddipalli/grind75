// getting issue distance mapping and node revisiting 
// for finding nearest 0 for 1 cell, we are revisting same cells again from direction which is increasing 
// recursive calls, hence causing time limit exceeded or stack overflow
class Solution {
  bool t1Visited = false,
      t2Visited = false,
      t3Visited = false,
      t4Visited = false;

  List<List<int>> updateMatrix(List<List<int>> mat) {
    List<List<int>> distance = [];
    // filling distance array to avoid index issue
    // this is problem with Dart, in java we can initialise with len M x N
    for (int i = 0; i < mat.length; i++) {
      List<int> temp = [];
      for (int j = 0; j < mat[i].length; j++) {
        temp.add(0);
      }
      distance.add(temp);
    }

    for (int i = 0; i < mat.length; i++) {
      for (int j = 0; j < mat[i].length; j++) {
        // if current element is zero then nearest zero is always 0, i.e itself
        if (mat[i][j] != 0) {
          t1Visited = t2Visited = t3Visited = t4Visited = false;
          print("finding distance for - $i $j - ${mat[i][j]}");
          distance[i][j] = getNearestZeroDistance(i, j, mat);
          print("Distance Is - ${distance[i][j]}");
        }
      }
    }

//    for(int i=0; i< mat.length;i++){
//      for(int j=0; j< mat[i].length;j++){
//        print("$i $j - ${distance[i][j]}");
//      }
//    }

    return distance;
  }

  int getNearestZeroDistance(int x, int y, List<List<int>> mat) {
    print("\nSearching for x = $x, y = $y, value is - ${mat[x][y]}");
    if (mat[x][y] == 0) {
      print("return true");
      return 1;
    }

    int t1 = 0, t2 = 0, t3 = 0, t4 = 0;
// now move in all 4 directions
    if (x >= 1) {
      print("t1");
      t1 += 1;
      t1 += getNearestZeroDistance(x - 1, y, mat);
      t1Visited = true;
    }
    if (y >= 1 && !t1Visited) {
      print("t2");
      t2 += getNearestZeroDistance(x, y - 1, mat);
      t2Visited = true;
    }
    if (x + 1 < mat.length && t1Visited && t2Visited) {
      print("t3");
      t3 += getNearestZeroDistance(x + 1, y, mat);
      t3Visited = true;
    }
    if (y + 1 < mat[0].length && t1Visited && t2Visited && t3Visited) {
      print("t4");
      t4 += getNearestZeroDistance(x, y + 1, mat);
      t4Visited = true;
    }
    print("t1 - $t1, t2 - $t2, t3 - $t3, t4 - $t4");
    return minOf4(t1, t2, t3, t4);
  }

  int minOf4(int a, int b, int c, int d) {
    List<int> num = [];
    if (a != 0) num.add(a);
    if (b != 0) num.add(b);
    if (c != 0) num.add(c);
    if (d != 0) num.add(d);
    if (num.isEmpty) return 0;
    int min = num.first;
    for (int i = 0; i < num.length; i++) {
      if (num[i] < min) min - num[i];
    }
    return min;
  }
}

void main() {
  print("Final Array - ${Solution().updateMatrix([
        [0, 0, 0],
        [0, 1, 0],
        [1, 1, 1]
      ])}");
}
