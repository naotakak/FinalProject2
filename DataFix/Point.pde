class Point {
  double x;
  double y;

  Point(double r, double c) {
    x = r;
    y = c;
  }

  double getX() {
    return x;
  }

  void scalePoint(double scale) {
    x = 505 + (x - 505) * scale;
    y = y * scale;
  }
  
  double getY() {
    return y;
  }

  double findX(Point other) {
    return other.getX() - getX();
  }

  double findY(Point other) {
    return other.getY() - getY();
  }

  double findHeading(Point other) {
    float ret = atan2((float)findY(other), (float)findX(other));
    return (double)degrees(ret);  
  }

  double getSlope(Point other) {
    return findY(other) / findX(other);
  }
  
  double dist(Point a) {
    return sqrt(pow((float)(a.getX() - this.getX()), 2) + pow((float)(a.getY() - this.getY()), 2));
  }
  
  double findRatio(Point a, Point aP) {
    return this.dist(a) / this.dist(aP);
  }
  
  String toString(){
    return "X is " + x + " Y is " + y;
    
  }
  
  
}