class MapFixer {
    Map old, toFix;
    int year, point, xCor, yCor;
    double scales;
    double toFixWidth, toFixHeight;
    double headDiff;
    Point[] points = new Point[4];
    BufferedReader getText;
    String text = "";
    PrintWriter mapNum;

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
      String[]lines = loadStrings("../mapYears.txt");
      for (int i = 0; i < lines.length; i ++) {
        text += lines[i];
        text += "\n";
      }
      println(text);
      mapNum = createWriter("../mapYears.txt");
      mapNum.println(text + fixMap.year);
      mapNum.flush();
      mapNum.close();
      String[]text = loadStrings("../numOfMaps.txt");
      mapNum = createWriter("../numOfMaps.txt");
      int maps = Integer.parseInt(text[0]) + 1;
      mapNum.println(maps);
      mapNum.flush();
      mapNum.close();
    }
    
    void headingDiff() {
      double baseHeading = points[0].findHeading(points[2]);
      double fixHeading = points[1].findHeading(points[3]);
      headDiff = baseHeading - fixHeading;
    }
    
    void fix() {
      Point a = new Point(66,398);
      Point aP = new Point(598,665);
      Point b = new Point(302,401);
      Point bP = new Point(1207,607);
      points[0] = a;
      points[1] = aP;
      points[2] = b;
      points[3] = bP;
      point = 2;
      headingDiff();
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
      double x = points[1].getX();
      println("x" + x);
      double y = points[1].getY();
      println(y);
      println(toScale);
      
      println(y);
      println("AFTER TRANSLATION: xCor is: " + xCor + " yCor is: " + yCor);
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
    
    void trans1(double x, double y) {
      yCor = 0;
      xCor -= 505 + (x - points[0].getX() - 505);
      println("diff is " + (points[0].getX() - points[1].getX()));
      yCor += points[0].getY() - y;// - y;
      println("this is point 3 coordinates " + points[3]);
      println("this is point 1 coordinates " + points[1]);
      println("this is point 0 coordinates " + points[0]);
      println("this is the diff of 1 and 0 x cor " + (points[1].getX() - points[0].getX()));
      x = points[3].getX();
      y = points[3].getY();
      println("this is x in trans 2 " + x + "\n this is y in trans 2 " + y);
      points[3].setY(y - points[1].getY() + points[0].getY());
      points[3].setX(x - points[1].getX() + points[0].getX());
      points[1] = points[0];
      
      println("for trans 2, point 1 is now at " + points[1]);
      println("for trans 2, point 3 is now at " + points[3]);
    }
    
    void display() {
        image(old.map, 0, 0, old.map.width/2, old.map.height/2);
        tint(255,127);
        if (point >= 2){
          println(headDiff);
          //trans1(points[1].getX() , yCor + points[1].getY());
          //trans1(points[1].getX(), points[1].getY());
          rotate((float)headDiff);
          points[1].pointAfterRotation((float)(-1 * headDiff));
          points[3].pointAfterRotation((float)(-1 * headDiff));
          trans1(points[1].getX() , yCor + points[1].getY());
          image(toFix.map, xCor, yCor, (int)toFixWidth, (int)toFixHeight);
          tint(255,255);
        }
        else{
        image(toFix.map, xCor, yCor, (int)toFixWidth, (int)toFixHeight);
        tint(255,255);
        }
    }
}