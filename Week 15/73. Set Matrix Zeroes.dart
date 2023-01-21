
void main() {
  MySolutionMemoization().setZeroes([
    [0, 1, 2, 0],
    [3, 4, 5, 2],
    [1, 3, 1, 5]
  ]);
}


// This solution is not working for 0,3 element which is zero
class MySolutionBruteForce {
  void setZeroes(List<List<int>> matrix) {
    int ROWS = matrix.length;
    int COLS = matrix[0].length;

    void makeRowZero(int rowIndex) {
      // iterate for column
      for (int c = 0; c < COLS; c++) {
        matrix[rowIndex][c] = 0;
      }
    }

    void makeColumnZero(int colIndex) {
      // iterate for row
      for (int r = 0; r < ROWS; r++) {
        matrix[r][colIndex] = 0;
      }
    }

    void printMatrix() {
      for (int r = 0; r < ROWS; r++) {
        String s = "[";
        for (int c = 0; c < COLS; c++) {
          s += " ${matrix[r][c]}";
        }
        s += " ]";
        print("$s");
      }
    }

    int row = 0;
    int col = 0;
    for (int r = row; r < ROWS; r++) {
      for (int c = col; c < COLS; c++) {
        print("checking ($r,$c)");
        if (matrix[r][c] == 0) {
          print("Found O at $r,$c");
          // make entrie row and column 0
          makeRowZero(r);
          makeColumnZero(c);
          printMatrix();

          // problem - after making row and col 0,
          // in next loop we are again finding 0 at (r,c)
          // which is increasing our repeatative work

          // so update pointers for next row and column
          print("updating boundaries by breaking row , col - ${row}, ${col}");
          col++;
          row++;
          print("updated boundaries by breaking row , col - ${row}, ${col}");
          break;
        }
      }
    }
  }
}

// Time - O( m x n ) - 71.43%
// Space - O( m x n ) - 14.29%

// for Space - O(1) Solution - https://www.youtube.com/watch?v=T41rL0L3Pnw

 
class MySolutionMemoization {
  void setZeroes(List<List<int>> matrix) {
    int ROWS = matrix.length;
    int COLS = matrix[0].length;
    
    List<List<int>> zeroPlaces = [];
    
    void makeRowZero(int rowIndex){
      // iterate for column
      for(int c=0;c<COLS;c++){
        matrix[rowIndex][c] = 0;
      }
    }
    
    void makeColumnZero(int colIndex){
      // iterate for row
      for(int r=0;r<ROWS;r++){
        matrix[r][colIndex] = 0;
      }
    }
    
    void printMatrix(){
       for(int r=0; r< ROWS;r++){
         String s = "[";
       for(int c=0; c< COLS;c++){
         s+= " ${matrix[r][c]}";
       }
       s += " ]";
         print("$s");
       }
    }

    for(int r=0; r< ROWS;r++){
       for(int c=0; c< COLS;c++){
         print("checking ($r,$c)");
           if(matrix[r][c] == 0){
             print("Found O at $r,$c");
             zeroPlaces.add([r,c]);
           }
       }
    }
    
    for(List<int> position  in zeroPlaces){
      int r = position[0];
      int c = position[1];
      print("Processing for ($r,$c)");
      makeRowZero(r);
      makeColumnZero(c);
      printMatrix();
    }
  }
}