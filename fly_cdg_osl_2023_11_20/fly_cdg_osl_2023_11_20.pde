import java.util.List;
class Tup {
  int x, y;
  color c;
}
int x = 0;
int s = 10;
int WID = 800;
int HEI = 800;
List<Tup> tups;
void setup() {

  size(800, 800);
  //frameRate(120);
  tups = new ArrayList<Tup>();

  for (int i = 0; i < WID; i++) {
    for (int j = 0; j < HEI; j++) {
      Tup t = new Tup();
      t.x = i * s;
      t.y = j * s;
      t.c = color(random(255));
      tups.add(t);
    }
  }
}

void drawTup(Tup t, boolean withId) {
  fill(t.c);
  rect(t.x, t.y, s, s);
}
void clear() {
  fill(255);
  rect(0, 0, width, height);
}
void draw() {
  clear();
  for (Tup t : tups) {
    drawTup(t, true);

    if (int(random(3)) == 1) {

      t.x += s ;
      t.y += s % height;
      // jt.c++;
      t.c+=s;
      t.c = min(t.c, 255);
    }

    t.x %= width;
    t.y %= height;
  }
}
