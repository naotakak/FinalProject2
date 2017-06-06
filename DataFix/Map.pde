class Map {
  PImage map;
  
  Map (String image) {
    map = loadImage(image);
  }
  
  void scale(double s, Point keep) {
    //scale and keep point static
  }
  
  void rotate(double d, Point keep) {
    //rotate and keep point static
  }
  
  void translate(int x, int y) {
    //move entire map
    
  }
  
  void setOpacity(double percent) {
    tint(255,255 * (int)(percent / 100)); //this doesn't work
  }
}