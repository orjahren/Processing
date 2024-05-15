
final int s = 10;
void setup() {
  size(800, 800);
  stroke(0);
  fill(255);
  frameRate(2);
}

int r = s;
int n_dots = 1;
void draw() {
  rect(0, 0, width, height);
  for (int i = 0; i < height; i += s) {
    line(0, i, width - i, height);
    line(width, i, i, height);
  }
  circle(width / 2, height / 2, r);
  for (int i = 0; i < height; i += s) {
    final float rnd = random(r);
    final float posX = random(width / 2) + width/4 - rnd;
    final float posY = random(height / 2) + height /4 - rnd;
    circle(posX, posY, rnd);
  }
  r++;
  n_dots += 1;
}
