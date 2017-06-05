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
  
  double dist(Point a) {
    return sqrt(pow(a.getX() - this.getX(), 2) + pow(a.getY() - this.getY(), 2));
  }
  
  double findRatio(Point a, Point aP) {
    return this.dist(a) / this.dist(aP);
  }
  
}