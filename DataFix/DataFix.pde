MapFixer fixMap;
   
   void setup() {
      fixMap = new MapFixer("../Maps/europeBase.png",  "../Maps/1792.jpg" );
      //add a way to choose the map you want to sae
      size(1000, 1000); //can change numbers without affecting anything
      surface.setResizable(true);
      surface.setSize(fixMap.getWidth()/2, fixMap.getHeight()/2);
      //need to resize image to fit window size
   }
   
   void draw() {
     fixMap.display();
     /* if (keyPressed && (key == ENTER || key == RETURN)) {
        fixMap.saveMap();
        //indicate saved
      }*/
      
      //put fix() function here and get rid of display()
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
    }
    if (key == ENTER || key == RETURN){
      fixMap.fix();
    }
    }
    
    

  