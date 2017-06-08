MapFixer fixMap;
   
   void setup() {
      fixMap = new MapFixer("../Maps/europeBase.png",  "../Maps/europeBase.png" );
      //add a way to choose the map you want to sae
      size(1000, 1000); //can change numbers without affecting anything
      surface.setResizable(true);
      surface.setSize(fixMap.getWidth()/2, fixMap.getHeight()/2);
   }
   
   void draw() {
   }
   
   void mousePressed() {
     fixMap.setPoint(mouseX, mouseY);
     ellipse(mouseX,mouseY,10,10); 
   }
   
   void keyPressed(){
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
    
    

  