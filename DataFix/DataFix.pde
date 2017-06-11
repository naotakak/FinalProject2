MapFixer fixMap;
String inputFile = "";
boolean typeable = false;

   void setup() {
      size(1000, 1000); 
      surface.setResizable(true);
      typeable = true;
      println(typeable);
   }
   
   void draw() {
     if (typeable) {
       background(222);
       textSize(32);
       text("Europe Borders\nXavier Chen & Naotaka Kinoshita\nInput filename: " + inputFile
             + "\nCommands - \nENTER: select map\nSHIFT: load maps\nMOUSE CLICK: select points\n"
             + "RIGHT ARROW: next point\nENTER:fix map\ns: save map", 50, 75);
       fill(0,102,153);
     }
   }
   
   void mousePressed() {
     if (!typeable) {
       fixMap.setPoint(mouseX, mouseY);
       ellipse(mouseX,mouseY,10,10); 
     }
   }
   
   void keyPressed(){
    if (typeable) {
      println("TYPE");
      if (key == BACKSPACE) {
        if (inputFile.length() > 0) {
          inputFile = inputFile.substring(0, inputFile.length() - 1);
          println(inputFile);
        }
      }
      else {
        inputFile += key;
        println(inputFile);
      }
      if (key == ENTER || key == RETURN) {
        inputFile = inputFile.replaceAll("\\s+" , "");
        fixMap = new MapFixer("../Maps/europeBase.png", "../Maps/" + inputFile);
        surface.setSize(fixMap.getWidth()/2, fixMap.getHeight()/2);
        typeable = false;
      }
    }
    else {
      if(key == CODED){
        if(keyCode == RIGHT){
         fixMap.nextPoint(); 
         println("true");
        }
        if(keyCode == SHIFT){
          fixMap.display();
          println("true");
        }
      }
      if (key == ENTER || key == RETURN){
        background(222);
        fixMap.fix();
      }
      if (key == 's' || key == 'S') {
        fixMap.saveMap();
        text("saved", 50, 75);
      }
    }
  }
    
    

  