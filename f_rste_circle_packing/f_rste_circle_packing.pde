import java.util.List;
import java.uril.ArrayList;

class Dot {
 int posX;
 int posY;
 int radius;
 Dot(int x, int y, int r) {
    this.posX = x;
    this.posY = y;
    this.radius = r;
 }
 
}

final int n = 1000;
List<List<Dot>> arr = new ArrayList<>(n);

void setup() {
  size(800, 800);
  for(int i = 0; i < n; i++) {
    int x = int(random(width));
    int y = int(random(height));
    
  }
  
  
}

void draw() {
  noLoop();
  println("done");
}
