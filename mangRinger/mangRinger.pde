import java.util.ArrayList;
void setup() {
  frameRate(144);
  ringer = new ArrayList<Ring>();  
  size(800, 800);
  fill(bfarge);
  rect(0, 0, width, height);
  noStroke();
  loadPixels();
}

public color ranFarge(int rad) {
  float a = random(rad);
  float b = random(rad % 255);
  float c = random(rad % 255);

  return color(a);//, b, c);
}

public color ranFarge() {
  float a = random(255);
  float b = random(255);
  float c = random(255);

  color ret = color(a, b, c);

  if (a == 255 && b == 255 && c == 255) ret =  ranFarge();

  return ret;
}


ArrayList<Ring> ringer;
final int radFak = width;
int grense = 100;
int min = 10;
int nf = 2;
public color minGet(int x, int y) {
  //return pixels[y*width + x];
  return(get(x, y));
}
final color bfarge = color(255);
void draw() {
  //loadPixels();
  //updatePixels();

  int x = int(random(width));
  int y = int(random(height));
  int rad = int(random(min, radFak));
  color f = ranFarge();

  Ring ny = new Ring(x, y, rad, f);
  //venstre, over, høyre, under
  PImage img = get(ny.x, ny.y, ny.rad, ny.rad);
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      if (img.get(i, j) != bfarge) return;
    }
  }
  ringer.add(ny); 
  ny.vis(); 

  Ring over = new Ring(x + nf, y + nf, rad - (2 * nf), bfarge); 
  over.vis();
}

void mouseClicked() {
  println(ringer.size());
}

class Ring {
  int x; 
  int y; 
  color farge; 
  int rad; 
  int dia; 
  Ring(int x, int y, int rad, color farge) {
    this.x = x; 
    this.y = y; 
    this.farge = farge; 
    this.rad =  rad; 
    this.dia = 2*rad;
  }

  void vis() {
    fill(this.farge); 
    //circle(x, y, rad);
    rect(x, y, rad, rad);
  }
}
