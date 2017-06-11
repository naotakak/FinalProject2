class MapFixer {
    Map old, toFix;
    int year, point, xCor, yCor;
    double scales;
    double toFixWidth, toFixHeight;
    boolean filter = false;
    Point[] points = new Point[4];

    MapFixer(String oldMap, String mapToFix) {
       old = new Map(oldMap);
       toFix = new Map(mapToFix);
       xCor = old.map.width/2;
       yCor = 0;
       setDim();
       setYear(mapToFix);
       println("YEAR " + year);
    }
    
    void setDim() {
      toFixWidth = toFix.map.width / 2;
      toFixHeight = toFix.map.height / 2;
    }
    
    void setYear(String filename) {
      String y = "";
      for (int i = 8; i < 12; i ++) {
        y += filename.charAt(i);
      }
      year = Integer.parseInt(y);
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
      surface.setSize(old.map.width/2, old.map.height/2);
      background(222);
      image(toFix.map, xCor, yCor, (int)toFixWidth, (int)toFixHeight);
      String s = "../FinishedMaps/" + year + ".jpg";
      save(s);
    }
    
    void fix() {
      /*Point a = new Point(67,399);
      Point aP = new Point(650,562);
      Point b = new Point(279, 205);
      Point bP = new Point(1066,208);
      points[0] = a;
      points[1] = aP;
      points[2] = b;
      points[3] = bP;*/
      println("xCor is: " + xCor + " yCor is: " + yCor);
      double toScale = points[0].dist(points[2]) / points[1].dist(points[3]);
      scales = toScale;
      scal(toScale); //only scale toFix
      println("preSize1 " + points[1]);
      println("preSize2 " + points[3]);
      points[1].scalePoint(toScale);
      points[3].scalePoint(toScale);
      println("afSize1 " + points[1]);
      println("afSize3 " + points[3]);
      //display();
      //double howMuchToRotate = points[0].findHeading(points[2]) - points[1].findHeading(points[3]);
      //rotat(howMuchToRotate); //need to override rotate function
      //allow direct translation
      double x = points[1].getX();
      println("x" + x);
      double y = points[1].getY();
      println(y);
      println(toScale);
      trans(x , yCor + y);
      println(y);
      println("AFTER TRANSLATION: xCor is: " + xCor + " yCor is: " + yCor);
      filter = true;
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
    
    void trans(double x, double y) {
      //xCor = 0;
      yCor = 0;
      xCor -= 505 + (x - points[0].getX() - 505);
      println("diff is " + (points[0].getX() - points[1].getX()));
      //xCor += points[1].getX() - points[0].getX() - 505;// - ((points[1].getX() - 505) * scales) ;// + x - 505;
      yCor += points[0].getY() - y;// - y;
    }
    
    void display() {
        image(old.map, 0, 0, old.map.width/2, old.map.height/2);
        tint(255,127);
        image(toFix.map, xCor, yCor, (int)toFixWidth, (int)toFixHeight);
        /*
        if (filter) {
          filter(GRAY);
        }
        */
        tint(255,255);
    }
}