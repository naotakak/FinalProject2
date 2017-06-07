class Map {
  PImage map;
  
  Map (String image) {
    map = loadImage(image);
  }
  
  void scal(double s) {
    //scale and keep point static
  }
  
  void rotat(double d) {
    //rotate and keep point static
  }
  
  void trans(int x, int y) {
    //background(222);
    translate(x,y);
    //background(222);
    
  }
  
  void setOpacity(double percent) {
    background(222);
    tint(255,255 * (int)(percent / 100));   //this doesn't work
  }
}