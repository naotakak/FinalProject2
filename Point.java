import java.lang.Math;
public class Point{
  private int x;
  private int y;

  public Point(int r, int c){
    x = r;
    y = c;
  }

  public int getX(){
    return x;
  }

  public int getY(){
    return y;
  }

  public int findX(Point other){
    return other.getX() - getX();
  }

  public int findY(Point other){
    return other.getY() - getY();
  }

  public double findHeading(Point other){
    double ret = Math.atan(getSlope(other));
    return Math.toDegrees(ret);
  }

  private double getSlope(Point other){
    return findY(other) / findX(other);
  }

  public static void main(String[]args){
    Point a = new Point(1,1);
    Point b = new Point(5,5);
    System.out.println(b.findX(a));
    System.out.println(b.findY(a));
    System.out.println(b.findHeading(a));

  }
}