MapFixer fixMap;
String inputFile = "";
boolean typeable = false;

   void setup() {
      //fixMap = new MapFixer("../Maps/europeBase.png",  "../Maps/1815.png" );
      //add a way to choose the map you want to sae
      size(1000, 1000); //can change numbers without affecting anything
      surface.setResizable(true);
      typeable = true;
      println(typeable);
      //surface.setSize(fixMap.getWidth()/2, fixMap.getHeight()/2);
   }
   
   void draw() {
     if (typeable) {
       background(222);
       textSize(32);
       text("Europe Borders\nXavier Chen & Naotaka Kinoshita\nInput filename: " + inputFile, 50, 75);
       fill(0,102,153);
     }
   }
   
   void mousePressed() {
     fixMap.setPoint(mouseX, mouseY);
     ellipse(mouseX,mouseY,10,10); 
   }
   
   void keyPressed(){
    if (typeable == true) {
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
      text("saved", 0, 0);
    }
    }
  }
    
    

  