import java.util.ArrayList;

void setup(){
   size(800, 800);
   f = width/s;
   background(255);
   
   
   for(int i = 0; i < width; i += s) {
     for(int j = height/4; j < height/2 + height/4; j += s) {  
       Boks ny = new Boks(i, j);
       l.add(ny);
     }
  }
}
int s  = 10;
float f;
ArrayList<Boks> l = new ArrayList<Boks>();
ArrayList<Boks> ferdige = new ArrayList<Boks>();
void draw() {
  ArrayList<Boks> slettes = new ArrayList<Boks>();
  for(Boks b : l) {
    b.farge = int(random(frameCount, 256));
    fill(b.farge);
    stroke(b.farge);
    if(b.farge >= 255) {
       slettes.add(b);//l.remove(b); 
    }
    
    rect(b.x, b.y, b.str, b.str);
  }
  
  for(Boks b : slettes) {
     ferdige.add(b);
     l.remove(b); 
  }
  
  if(l.size() == 0) {
    noStroke();
    for(Boks b : ferdige) {
      rect(b.x, b.y, b.str, b.str);
    }
    println("Ferdig");
    noLoop();
  }
}
class Boks {
   float x, y;
   int farge;
   int str = s;
   Boks(float x, float y) {
   this.x = x;
   this.y = y;
 }
}
