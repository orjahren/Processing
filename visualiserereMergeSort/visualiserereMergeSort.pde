import java.util.ArrayList;
import java.util.Arrays;

void setup() {
  size(800, 800);
  noStroke();
  f = width/s;
  soyler = new ArrayList<Soyle>();

  ArrayList<Integer> alleTall = new ArrayList<Integer>();
  for (int i = 0; i < width / s; i++) {
    alleTall.add(i);
  }

  for (int i = 0; i < width; i += s) {
    int index = (int) (Math.random() * alleTall.size());
    int ut = alleTall.get(index);
    alleTall.remove(index);
    int h = ut;//int(random(height));
    Soyle ny = new Soyle(i, height, h);
    soyler.add(ny);
  }
  arr = new Soyle[soyler.size()];
  for (int i = 0; i < soyler.size(); i++) {
    arr[i] = soyler.get(i);
  }

  frameRate(144);
}

final int s = 1;
int f;

ArrayList<Soyle> soyler;
Soyle[] arr;
int curr_size = 1;
int left_start;

int i, j, k;
int n1;// = mid - left_start + 1;
int n2;// = right_end - mid;
int mid;// = Math.min(left_start + curr_size - 1, n-1);
int right_end;// = Math.min(left_start + 2*curr_size - 1, n-1);
boolean whiler = false;

Soyle  L[];
Soyle  R[];

boolean status[] = {false, false, false, false, false};

boolean skalNy = false;

void draw() {
  tegnAlle();
  int n = arr.length;
  if (curr_size > n -1) {
    println("ferdig");
    noLoop();
    return;
  }
  if (left_start >= n-1 ) {
    left_start = 0;
    curr_size *= 2;
  } 

  if (skalNy == true) {

    skalNy = false;

    mid = Math.min(left_start + curr_size - 1, n-1);
    right_end = Math.min(left_start + 2*curr_size - 1, n-1);

    n1 = mid - left_start + 1;
    n2 = right_end - mid;
    L = new Soyle[n1];
    R = new Soyle[n2];
    for (i = 0; i < n1; i++)
      L[i] = arr[left_start + i];
    for (j = 0; j < n2; j++)
      R[j] = arr[mid + 1+ j];
    i = 0;
    j = 0;
    k = left_start;
    //whiler = true;
    for (int ind = 0; ind < status.length; ind++) {
      status[i] = true;
    }
  } else {

    if (whiler() == false && skalNy == false) {
      n1 = mid - left_start + 1;
      n2 = right_end - mid;
      L = new Soyle[n1];
      R = new Soyle[n2];
      for (i = 0; i < n1; i++)
        L[i] = arr[left_start + i];
      for (j = 0; j < n2; j++)
        R[j] = arr[mid + 1+ j];
      i = 0;
      j = 0;
      k = left_start;
      //whiler = true;

      for (int ind = 0; ind < status.length; ind++) {
        status[i] = true;
      }
      /*
      skalNy = true;
       
       return;
       */
    }
    boolean he = false;
    //0
    if (i < n1 && j < n2) {
      L[i].vis(color(0, 255, 0));
      R[j].vis(color(255, 0, 0));
      he = false;
      status[0] = true;
      if (L[i].h <= R[j].h) {
        arr[k] = L[i];
        i++;
        //whiler = true;
        status[1] = true;
        he = true;
      } else {
        arr[k] = R[j];
        j++;
        //whiler = true;
        status[2] = true;
        he = true;
      }
      k++;
    } else {
      //whiler = false;
      status[0] = false;
    }

    if (he == false) {
      status[0] = false;
      status[1] = false;
      status[2] = false;
    }

    //1
    if (i < n1) {
      arr[k] = L[i];
      i++;
      k++;
      //whiler = true;
      status[3] = true;
    } else {
      //whiler = false;
      status[3] = false;
    }

    //2
    if (j < n2) {
      arr[k] = R[j];
      j++;
      k++;
      //whiler = true;
      status[4] = true;
    } else {
      //whiler = false;
      status[4] = false;
    }
  }
  
  if(whiler() == false) {
     skalNy = true; 
     left_start += 2*curr_size;
  }
}

boolean whiler() {
  for (boolean b : status) {
    if (b == true) {
      return true;
    }
  }
  return false;
}

void mouseClicked() {
  //save("MergeSort 210321.png");
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
