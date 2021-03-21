void setup() {
  size(800, 800);

  noStroke();

  
  rect(0, 0, width, height);

  noFill();
  stroke(cColor);
  //fill(cColor);
  circle(width/2, height/2, DIA);
  
  
  
  noLoop();
  loadPixels();
  float o = 0;
  for (int i = 0; i < pixels.length; i++) {
    if (pixels[i] == cColor) {
      o++;
    }
  }
  
  println(o / DIA);
}


final color bColor = color(255);
final color cColor = color(0);//(0, 255, 0);
final color rColor = color(0, 0, 255);

final int DIA = 400;

void draw() {
}
