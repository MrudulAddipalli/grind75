// Solution - https://www.youtube.com/watch?v=BJnMZNwUk1M&t=380s

class Solution {
  List<int> spiralOrder(List<List<int>> matrix) {
    
    
    List<List<bool>> visitedMatrix = [];
    
    for(int i=0;i<matrix.length;i++){
      List<bool> row = [];
      for(int j=0;j<matrix[i].length;j++){
        row.add(false);
      }
      visitedMatrix.add(row);
    }
    
    List<int> res = [];
    int X = matrix.length, Y = matrix[0].length;
    int totalElements = X * Y;
    int x=0,y=0;
    
    
    bool visited(int x, int y){ return visitedMatrix[x][y]; }
    
    while(totalElements > 0){
      print("element at (x,y) 0 ($x,$y) - ${matrix[x][y]}");
      res.add(matrix[x][y]);
      visitedMatrix[x][y] = true;
      
      // update index
      if( (x == 0 || x<=X-1)  && y<Y-1) y++;
      else if(y == Y-1 && x<X-1) x++;
      else if(x == X-1 && y>0) {
       if(visitedMatrix[x][y-1]) {
          Y = Y-1;
        }
        y--;
      }
      else if(y == 0 && x>0){
        if(visitedMatrix[x-1][y]) {
          X = X-1;
        }
        x--;
      }
      
      totalElements--;
    }
    return res;
  }
}


void main() {
  final result = Solution().spiralOrder(
    [
      [1,2,3,4],
      [5,6,7,8],
      [9,10,11,12]
    ]);
  
//    final result = Solution().spiralOrder(
//      [
//        [1,2,3],
//        [4,5,6],
//        [7,8,9]
//      ]
//    );
  
  print('Text Case 1 - ${result}');
}
