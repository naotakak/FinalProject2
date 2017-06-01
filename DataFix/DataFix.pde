class DataFix {
   MapFixer fixMap;
   
   void setup() {
      fixMap = new MapFixer("/Maps/europeBase.png",  "/Maps/1792.jpg");
      size(fixMap.getWidth, fixMap.getHeight);
   }
   
   void draw() {
      if (mousePressed) {
        fixMap.setPoint(mouseX, mouseY);
      }
      if (keyPressed && key == ' ') {
        fixMap.nextPoint();
      }
      if (keyPressed && (key = "ENTER" || key == "RETURN")) {
        fixMap.saveMap();
      }
      fixMap.display();
   }
}