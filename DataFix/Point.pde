import java.lang.Math;
 class Point{
   int x;
   int y;

   Point(int r, int c){
    x = r;
    y = c;
  }

   int getX(){
    return x;
  }

   int getY(){
    return y;
  }

   int findX(Point other){
    return other.getX() - getX();
  }

   int findY(Point other){
    return other.getY() - getY();
  }

   double findHeading(Point other){
    double ret = Math.atan(getSlope(other));
    return Math.toDegrees(ret);
  }

   double getSlope(Point other){
    return findY(other) / findX(other);
  }
}