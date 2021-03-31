import java.util.ArrayList;
void setup() {
  size(800, 800);
  noStroke();
  frameRate(10000);
  reset();
}
void reset() {
  i = 0;
  j = 0;
  soyler = new ArrayList<Soyle>();
  ArrayList<Integer> alleTall = new ArrayList<Integer>();
  for (int ind = 0; ind < width; ind += s) {
    alleTall.add(ind);
  }
  for (int loop = 0; loop < width; loop += s) {
    int index = (int) (Math.random() * alleTall.size());
    int ut = alleTall.get(index);
    alleTall.remove(index);
    int h = ut;//int(random(height));
    Soyle ny = new Soyle(loop, height, h);
    soyler.add(ny);
  }
  arr = new Soyle[soyler.size()];
  for (int loop = 0; loop < soyler.size(); loop++) {
    arr[loop] = soyler.get(loop);
  }
  n = arr.length;
}

int s = 1;
int n;
ArrayList<Soyle> soyler;
Soyle[] arr;
int i, j;
void draw() {
  tegnAlle();
  if (i > n) {
    println("Ferdg");
    ny();
    //noLoop();//i = 0;
  }
  for(j = 0; j < n - i - 1; j++) {
    if (arr[j].h > arr[j + 1].h) {
      Soyle tmp = arr[j];
      arr[j] = arr[j + 1];
      arr[j + 1] = tmp;
    }
  }
  i++;
  /*
  if (j >= n - 1 - i) {
    j = 0;
    i++;
  } else {
    if (arr[j].h > arr[j + 1].h) {
      Soyle tmp = arr[j];
      arr[j] = arr[j + 1];
      arr[j + 1] = tmp;
    }
    j++;
  }
  */
}

void mouseClicked() {
  s = 1;
  reset();
}

void ny() {
  if (s - 1 > 0) {
    s -= 1;
    reset();
  }else {
    reset();//noLoop();
  }
}

public void visAlle() {
  tegnAlle();
}

void tegnAlle() {
  clear();
  for (int i = 0; i < arr.length; i++) {
    arr[i].x = s * i;
    arr[i].vis();
  }
}

class Soyle {
  int x, y, h;
  color sfarge;
  Soyle(int x, int y, int h) {
    this.x = x;
    this.y = y;
    this.h = h;
    sfarge = 255;
  }

  void vis() {
    fill(sfarge);
    rect(x, height - h, s, h);
  }

  void vis(color farge) {
    fill(farge);
    rect(x, height - h, s, h);
  }
}
