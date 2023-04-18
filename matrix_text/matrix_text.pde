import java.util.List;

List<String> sl;
List<Character> cl;
List<Integer> offsetList;
List<Integer> xList;
final int s = 20;
final int n_chars = 1000;
int n_lines;

char getRandomChar() {
  return char(65 + int(random(27)));
}

String getRandomString(int n_chars) {
  String res = "";
  for (int i = 0; i < n_chars; i++) {
    res += getRandomChar();
  }
  return res;
}

void setup() {
  size(800, 800);
  sl = new ArrayList<String>();
  cl = new ArrayList<Character>();
  n_lines = width / s;
  textSize(s);
  offsetList = new ArrayList<Integer>(n_lines);
  xList = new ArrayList<Integer>(n_lines);
  for (int i = 0; i <  n_lines; i++) {
    sl.add(getRandomString(width));
    offsetList.add(0);
  }
  for (int i = 0; i <  n_chars; i++) {
    char c = getRandomChar();
    cl.add(c);
    offsetList.add(0);
    xList.add(int(random(width)));
  }
}

void draw() {
  clear();
  fill(0, 175, 0);
  for (int i = 0; i < sl.size(); i++) {
    int offset = offsetList.get(i);
    text(sl.get(i), 0, (offset + i * s) % height);
    //int newOffset = offset + 5;
    int newOffset = 5 * (((offset + 5)) / 5);
    offsetList.set(i, newOffset);
  }

  for (int i = 0; i < cl.size(); i++) {
    fill(0, Math.max(200, int(random(255))), 0);
    char c = cl.get(i);
    int offset = offsetList.get(sl.size() + i);
    text(c, xList.get(i), (offset + i * s) % height);
    int newOffset = 5 * ((offset + int(random(s))) / 5);
    offsetList.set(sl.size() + i, newOffset);
  }
}
