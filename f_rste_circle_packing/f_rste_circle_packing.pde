import java.util.List;
import java.util.ArrayList;

class Dot {
 float posX;
 float posY;
 float radius;
 Dot(float x, float y, float r) {
    this.posX = x;
    this.posY = y;
    this.radius = r;
 }
 
}

final int n = 10000;
List<List<Dot>> arr = new ArrayList<>(n);
List<Dot> dots = new ArrayList<>();

void setup() {
  size(800, 800);
  noStroke();
  
  for(int i = 0; i < n; i++) {
    float x = random(width);
    float y = random(height);
    float s = random(10);
    Dot d = new Dot(x, y, s);
    dots.add(d);
    
  }
  
  
}

void draw() {
  clear();
  for(Dot d : dots) {
    fill(random((d.posY/2 + (d.radius * 100) % 255)));
    ellipse(d.posX, d.posY, d.radius, d.radius);
    
    d.posY += random(d.radius);
    
    if (d.posY + d.radius > height) {
       d.posY = -d.radius;
       d.posX = random(width);
    }
  }
  
}
