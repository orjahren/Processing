void setup() {
  frameRate(144);
  size(800, 800);
  
  x = 0;
  s = width;
}

int x;
int s;
void draw() {

  noFill();
  //stroke(random(255), random(255), random(255));//stroke(x, 255 - x);
  stroke(x % 255);//, 255 - x);
  rect(x, x, s, s);
  x += 2;
  s-= 4;

  if ((s <= 0) || (x >= width/2)) {
    println("Ferdig");
    noLoop();
  }
}

void mouseClicked() {
  save("boxer.png");
}
