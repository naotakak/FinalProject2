class MapFixer {
    PImage old;
    PImage toFix;
    int year;
    Point[] points = new Point[6];
    int point;
    int xCor;
    int yCor;
  
    MapFixer(String oldMap, String mapToFix) {
       old = loadImage(oldMap);
       mapToFix = loadImage(mapToFix);
       xCor = old.width;
       yCor = 0;
    }
    
    int getWidth() {
       return old.width + mapToFix.width;
    }
    
    int getHeight() {
       if (old.height > mapToFix.height) {
          return old.height;
       }
       else {
          return mapToFix.height;
       }
    }
    
    void fix() {
       while (point < points.size) {
         this.fixer();
       }
    }
    
    void fixer() {
      if (point == 0) { //allow direct translation
         mapToFix.translate(points[0].findX(points[1]), points[0].findY(points[1]));
      }
      //find how much to scale
      if (toScale != 0) {
         mapToFix.ourScale(toScale, points[1]); //add ourScale to keep point in place
         //add rotate
      }
    }
    void nextPoint() {
       point ++;
    }
    
    void setPoint(int x, int y) {
       points[point] = new Point(x, y);
    }
    
    void display() {
        image(old, 0, 0);
        image(mapToFix, xCor, yCor);
    }
}