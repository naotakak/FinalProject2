MapFixer fixMap;
   
   void setup() {
      fixMap = new MapFixer("../Maps/europeBase.png",  "../Maps/1792.jpg");
      //add a way to choose the map you want to save
      size(1000, 1000); //can change numbers without affecting anything
      surface.setResizable(true);
      surface.setSize(fixMap.getWidth()/2, fixMap.getHeight()/2);
      //need to resize image to fit window size
   }
   
   void draw() {
      if (mousePressed) {
        fixMap.setPoint(mouseX, mouseY);
        //indicate point was chosen
      }
      //add an undo function
      if (keyPressed && key == ' ') {
        fixMap.nextPoint();
        //indicate on nextPoint
      }
      if (keyPressed && (key == ENTER || key == RETURN)) {
        fixMap.saveMap();
        //indicate saved
      }
      fixMap.display();
      //put fix() function here and get rid of display()
   }