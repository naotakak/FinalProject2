class Map {
  PImage map;

  Map(String filename) {
    map = loadImage("../FinishedMaps/" + filename + ".jpg");
  }
}