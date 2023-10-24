
void setup() {
  size(400, 400);
  noStroke();
  frameRate(120);
}

int x = 0;
int y = 0;
final int s = 10;
void draw() {
  if (y > height) {
    y = 0;
  }
  fill(random(255), random(255), random(255));
  rect(x, y, s, s);

  y = x >= width ? y + s : y;
  x = y > height ? 0 : x + s;
}
