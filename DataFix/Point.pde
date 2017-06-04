class Point {
  int x;
  int y;

  Point(int r, int c) {
    x = r;
    y = c;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  int findX(Point other) {
    return other.getX() - getX();
  }

  int findY(Point other) {
    return other.getY() - getY();
  }

  float findHeading(Point other) {
    float ret = atan2(findY(other), findX(other));
    return degrees(ret);  
  }

  double getSlope(Point other) {
    return findY(other) / findX(other);
  }
}