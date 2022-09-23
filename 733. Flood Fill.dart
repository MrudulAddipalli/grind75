class Solution {
  List<List<int>> floodFill(
      List<List<int>> image, int sr, int sc, int newcolor) {
    if (image.isEmpty) {
      print("List is empty");
      return image;
    }
    late int pixelColor;
    try {
      // index issue can happen instead of checking 2D array lenght , added try catch block
      pixelColor = image[sr][sc];
    } catch (e) {
      return image;
    }
    print("pixelColor - $pixelColor, newcolor - $newcolor");
    if (pixelColor != newcolor) {
      myfloodfill(image, sr, sc, pixelColor, newcolor);
    }
    return image;
  }

  void myfloodfill(
      List<List<int>> image, int sr, int sc, int pixelColor, int newcolor) {
    print("myfloodfill($sr,$sc,$pixelColor,$newcolor)");
    if (image[sr][sc] == pixelColor) {
      image[sr][sc] = newcolor;
      if (sr >= 1) myfloodfill(image, sr - 1, sc, pixelColor, newcolor);
      if (sc >= 1) myfloodfill(image, sr, sc - 1, pixelColor, newcolor);
      if (sr + 1 < image.length)
        myfloodfill(image, sr + 1, sc, pixelColor, newcolor);
      if (sc + 1 < image[0].length)
        myfloodfill(image, sr, sc + 1, pixelColor, newcolor);
    }
  }

  print2DArray(List<List<int>> image) {
    String str = "";
    for (int i = 0; i < image.length; i++) {
      str = "";
      for (int j = 0; j < image[i].length; j++) {
        str += "   ${image[i][j]}   ";
      }
      print("$str\n");
    }
  }
}

void main() {
  Solution sol = Solution();
  List<List<int>> image = [
    [1, 1, 1],
    [1, 1, 0],
    [1, 0, 1]
  ];
  sol.print2DArray(image);
  image = sol.floodFill(image, 1, 1, 2);
  print("\n  After Process    \n\n");
  sol.print2DArray(image);
}
