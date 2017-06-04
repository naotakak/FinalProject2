class MapFixer {
    PImage old;
    PImage toFix;
    int year;
    Point[] points = new Point[4];
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
       while (i < points.length - 1) {
         this.fixer(i);
         i += 2;
       }
    }
    
    void saveMap() {
      
    }
    
    void fixer(int i) {
      if (i == 0) { //allow direct translation
         toFix.translate(points[0].findX(points[1]), points[0].findY(points[1]));
      }
      else {
        //rotate first, then scale
        double howMuchToRotate = points[0].findHeading(points[i + 1]) - points[0].findHeading(points[i]);
        toFix.rotate(howMuchToRotate); //need to override rotate function
        //points should now be collinear
        //find how much to scale
        double toScale = findRatio(points[0], points[i], points[i + 1]);
        toFix.scale(toScale, points[0]); //add ourScale to keep point in place
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