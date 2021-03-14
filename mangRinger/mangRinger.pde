import java.util.ArrayList;
void setup() {
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

  if (a == 255 && b == 255 && c == 255) return ranFarge();

  return color(a, b, c);
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
  if ((minGet(ny.x - ny.rad, ny.y) == bfarge) && (minGet(ny.x, ny.y - ny.rad) == bfarge) && (minGet(ny.x + ny.rad, ny.y) == bfarge) && (minGet(ny.x, ny.y + ny.rad) == bfarge)) {
    ringer.add(ny);
    ny.vis();

    Ring over = new Ring(x, y, rad - nf, bfarge);
    //over.vis();
  } else {
    //println("Unngår å lage noe i " + ny.x + " " + ny.y + " rad: " + ny.rad);
  }
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
    circle(x, y, rad);
  }
}
