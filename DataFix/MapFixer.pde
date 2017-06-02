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
       toFix = loadImage(mapToFix);
       xCor = old.width;
       yCor = 0;
    }
    
    int getWidth() {
       return old.width + toFix.width;
    }
    
    int getHeight() {
       if (old.height > toFix.height) {
          return old.height;
       }
       else {
          return toFix.height;
       }
    }
    
    void fix() {
       int i = point;
       while (i < points.length) {
         this.fixer(i);
       }
    }
    
    void saveMap() {
      
    }
    
    void fixer(int i) {
      if (i == 0) { //allow direct translation
         translate(points[0].findX(points[1]), points[0].findY(points[1]));
      }
      //find how much to scale
      /*
      double toScale;
      if (points[i].findHeading(points[i + 1]) > 0 && points[i].findHeading(points[i + 1]) < 90 ||
          points[i].findHeading(points[i + 1]) > 180 && points[i].findHeading(points[i + 1]) < 270) {
            toScale = points[i].getX()
      */
      if (toScale != 0) {
         toFix.ourScale(toScale, points[1]); //add ourScale to keep point in place
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
        image(toFix, xCor, yCor);
    }
}