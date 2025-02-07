import java.util.*;
int x = 0;
int y = 0;
final int s = 5;

void setup() {
  size(800, 800);
  frameRate(120);
  // stroke(0);
  noStroke();
}

class Cord {
  int x, y;

  Cord(int x, int y) {
    this.x=x;
    this.y=y;
  }
};


int truncateToMultiple(int numToRound, int multiple) {
  if (multiple == 0)
    return numToRound;

  int remainder = numToRound % multiple;
  if (remainder == 0)
    return numToRound;

  return numToRound + multiple - remainder;
}


final HashSet<Cord> seen = new HashSet<>();
final int numPrGen = 10;


void draw() {
  for (int i = 0; i < numPrGen; i++) {
    fill(random(255), random(255), random(255));

    int randX = int(random(width)) ;//%s;
    int randY = int(random(height)) ;//% s;

    randX = truncateToMultiple(randX, s);
    randY = truncateToMultiple(randY, s);

    Cord pos = new Cord(randX, randY);

    if (seen.contains(pos)) continue;

    seen.add(pos);


    rect(pos.x, pos.y, s, s);

    //rect(x, y, s, s);
    x += s;
    if (x > width) {
      y += s;
      x = 0;
    }
  }
}
