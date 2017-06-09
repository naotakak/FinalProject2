//File[]years;
String inputYear = "";
PImage map;

void setup() {
  size(505,505);
  //years = listFiles("/FinishedMaps/");
}

void draw() {
  
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
    map = loadImage("../FinishedMaps/" + inputYear + ".jpg");
    image(map, 0 , 0);
  }
}
  