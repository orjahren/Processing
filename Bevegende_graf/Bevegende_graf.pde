class Box {
  float x;
  float y;
  float s;
  color c;
  float cnt;
  color lineColor;
  Box(float x, float y, float s) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.c = color(255);
    this.cnt = 255;
    this.lineColor = color(random(255), random(255), random(255));
  }
}


final int s = 50;
final int hopp = 1;
final int TAINT_PR_IT = 10;

ArrayList<Box> boxes;
ArrayList<Box> tainted;
ArrayList<Box> stack;
ArrayList<Box> clean;

void setup() {
  size(800, 800);
  //size(400, 400);
  //frameRate(10);
  noStroke();
  boxes = new ArrayList<>();
  tainted = new ArrayList<>();
  stack = new ArrayList<>();
  clean = new ArrayList<>();

  for (int i = 0; i < width; i += s) {
    for (int j = 0; j < height; j += s) {
      Box b = new Box(random(width), random(height), s);
      //Box b = new Box(i, j, s);
      boxes.add(b);
      clean.add(b);
    }
  }
}

void draw() {
  //clear();
  fill(255);
  rect(0, 0, width, height);

  for (int i = 0; i < min(clean.size(), TAINT_PR_IT); i++) {
    int idx = int(random(clean.size()));
    Box br;
    try {
      br = clean.get(idx);
    }
    catch (IndexOutOfBoundsException e) {
      br = null;
    }
    if (br != null) {

      tainted.add(br);
      clean.remove(idx);

      br.c = color(0);
      br.cnt = random(150, 255);
    }
  }
  //for (Box b : boxes) {
  for (int i = 0; i < boxes.size(); i++) {
    Box b = boxes.get(i);

    fill(color(b.cnt));
    rect(b.x, b.y, b.s, b.s);

    Box next = boxes.get((i + 1) % (boxes.size() - 1));
    //color c = color(random(255),random(255),random(255));
    //fill(random(255),random(255),random(255));
    fill(b.lineColor);
    stroke(b.lineColor);
    ellipse(b.x + b.s/2, b.y + b.s/2, b.s/2, b.s/2);
    //ellipse(b.x + b.s/2, b.y + next.s/2, next.s/2, next.s/2);
    line(b.x + b.s/2, b.y + b.s/2, next.x + next.s/2, next.y + next.s/2);
    noStroke();
  }
  stack.clear();
  for (int i = 0; i < boxes.size(); i++) {
    Box t = boxes.get(i);

    t.cnt += hopp;


    if (t.x + t.s< width) {
      //t.x += random(1);
      t.x++;
    } else {
      t.x = 0;
    }
    if (t.y + t.s < height) {

      //t.y += random(1);
      t.y++;
    } else {
      t.y = 0;
    }

    if (t.cnt > 255) {
      t.c = color(255);
      t.cnt = 255;
      //tainted.remove(i);
      clean.add(t);
    } else {
      stack.add(t);
    }
  }
  tainted.clear();
  for (Box st : stack) {
    tainted.add(st);
  }
}
