class MapFixer {
    Map old;
    Map toFix;
    int year, point, xCor, yCor;
    double toFixWidth, toFixHeight;
    Point[] points = new Point[4];

    MapFixer(String oldMap, String mapToFix) {
       old = new Map(oldMap);
       toFix = new Map(mapToFix);
       xCor = old.map.width;
       yCor = 0;
       toFixWidth = toFix.map.width/2;
       toFixHeight = toFix.map.height/2;
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
    
    void saveMap() {
      String s = "../FinishedMaps/" + year + ".jpg";
      save(s);
    }
    
    void fix() {
      double toScale = points[0].dist(points[2]) / points[1].dist(points[3]);
      scal(toScale); //only scale toFix
      points[1].scalePoint(toScale);
      points[3].scalePoint(toScale);
      display();
      //double howMuchToRotate = points[0].findHeading(points[2]) - points[1].findHeading(points[3]);
      //rotat(howMuchToRotate); //need to override rotate function
      //allow direct translation
      int x = points[0].findX(points[1]);
      int y = points[0].findY(points[1]);
      trans(-10 * x, y / 2);
      display();
    }
    
    void nextPoint() {
       point ++;
    }
    
    void setPoint(int x, int y) {
       points[point] = new Point(x, y);
       for(int i = 0; i < points.length; i ++){
          println(points[i] + " element: " + i);
       }
       
    }
    
    void scal(double s) {
      toFixWidth = toFixWidth * s;
      toFixHeight = toFixHeight * s;
    }
    
    void trans(int x, int y) {
      xCor -= x;
      yCor -= y;
    }
    
    void display() {
        //background(222);
        image(old.map, 0, 0, old.map.width/2, old.map.height/2);
        tint(255,127);
        image(toFix.map, xCor/2, yCor/2, (int)toFixWidth, (int)toFixHeight);
        tint(255,255);
    }
}