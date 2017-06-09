//File[]years;
String inputYear = "";
Map map;
boolean inputReady = false;

void setup() {
  size(505,505);
  //years = listFiles("/FinishedMaps/");
}

void draw() {
  if (inputReady) {
    map = new Map(inputYear);
    //image(map.map, 0 ,0);
  }
}

void keyPressed() {
  if (key == BACKSPACE) {
    if (inputYear.length() > 0) {
      inputYear = inputYear.substring(0, inputYear.length() - 1);
      println(inputYear);
    }
  }
  else {
    inputYear += key;
    println(inputYear);
  }
  if (key == ENTER || key == RETURN) {
    inputReady = true;
  }
}
  