class MapFixer {
    Map old;
    Map toFix;
    int year, point, xCor, yCor;
    Point[] points = new Point[4];

    MapFixer(String oldMap, String mapToFix) {
       old = new Map(oldMap);
       toFix = new Map(mapToFix);
       xCor = old.map.width;
       yCor = 0;
    }
    
    int getWidth() {
       return old.map.width + toFix.map.width;
    }
    
    int getHeight() {
       if (old.map.height > toFix.map.height) {
          return old.map.height;
       }
       else {
          return toFix.map.height;
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
      String s = "../FinishedMaps/" + year + ".jpg";
      save(s);
    }
    
    void fixer(int i) {
      if (i == 0) { //allow direct translation
         toFix.translate(points[0].findX(points[1]), points[0].findY(points[1]));
      }
      else {
        //rotate first, then scale
        double howMuchToRotate = points[0].findHeading(points[i + 1]) - points[0].findHeading(points[i]);
        toFix.rotate(howMuchToRotate, points[0]); //need to override rotate function
        //points should now be collinear
        //find how much to scale
        double toScale = points[0].findRatio(points[i], points[i + 1]);
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
        image(old.map, 0, 0, old.map.width/2, old.map.height/2);
        image(toFix.map, xCor/2, yCor/2, toFix.map.width/2, toFix.map.height/2);
        //need to add opacity
    }
}