class Box {
  float x;
  float y;
  float s;
  color c;
  float cnt;
  Box(float x, float y, float s) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.c = color(255);
    this.cnt = 255;
  }
}


final int s = 2;
final int hopp = 10;
final int TAINT_PR_IT = 1000;

ArrayList<Box> boxes;
ArrayList<Box> tainted;
ArrayList<Box> stack;
ArrayList<Box> clean;

void setup() {
  size(800, 800);
  //frameRate(10);
  noStroke();
  boxes = new ArrayList<>();
  tainted = new ArrayList<>();
  stack = new ArrayList<>();
  clean = new ArrayList<>();

  for (int i = 0; i < width; i += s) {
    for (int j = 0; j < height; j += s) {
      Box b = new Box(i, j, s);
      boxes.add(b);
      clean.add(b);
    }
  }
}

void draw() {
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
      br.cnt = 0;
    }
  }
  for (Box b : boxes) {
    fill(color(b.cnt));
    rect(b.x, b.y, b.s, b.s);
  }
  stack.clear();
  for (int i = 0; i < tainted.size(); i++) {
    Box t = tainted.get(i);

    t.cnt += hopp;
    if (i % 2 == 0) {
      t.y = max(0, t.y - 1);
    } else {
      t.y = min(0, t.x - 1);
    }

    if (t.x <= 0) {
      t.x = width;
    }
    if (t.y <= 0) {
      t.y = height;
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
