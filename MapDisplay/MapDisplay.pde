import controlP5.*;

ControlP5 cp5;
String[] yearList;
String inputYear = "";
Map map;
boolean inputReady = false;
int yearSlider;

void setup() {
  size(505,505);
  cp5 = new ControlP5(this);
  yearList = loadStrings("../mapYears.txt");
  yearList = sort(yearList);
  yearSlider = Integer.parseInt(yearList[0]);
  cp5.addSlider("yearSlider").setPosition(50, 25).setRange(
    Float.parseFloat(yearList[0]), 
    Float.parseFloat(yearList[yearList.length - 1])).setSize(150,25);
}

void draw() {
  map = new Map("" + yearSlider);
  try {
    image(map.map, 0 ,0);
  }catch (Exception e) {
    //background(222);
    println("missing file");
  }
}
  