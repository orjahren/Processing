import java.util.ArrayList;
import java.util.Arrays;

void setup() {
  size(800, 800);
  f = width/s;
  soyler = new ArrayList<Soyle>();

  for (int i = 0; i < width; i += s) {
    int h = int(random(height));
    Soyle ny = new Soyle(i, height, h);
    soyler.add(ny);
  }
  arr = new Soyle[soyler.size()];
  for (int i = 0; i < soyler.size(); i++) {
    arr[i] = soyler.get(i);
  }

  //frameRate(4);
}

final int s = 2;
int f;

ArrayList<Soyle> soyler;
Soyle[] arr;
//int i = 0; 
//int j = 0;
boolean erFerdig;
boolean harFlyttet;

int curr_size = 1;
int left_start;



void draw() {
  //Arrays.sort(arr);
  tegnAlle();
  int n = arr.length;

  if (curr_size > n -1) {
    println("ferdig");
    //noLoop();
    //return;
  }
/*
  if (left_start >= n-1) {
    left_start = 0;
    //curr_size *= 2;
    //return;
  }
  */

  int mid = Math.min(left_start + curr_size - 1, n-1);

  int right_end = Math.min(left_start + 2*curr_size - 1, n-1);

  //merge(arr, left_start, mid, right_end);
  int i, j, k;
 

  int n1 = mid - left_start + 1;
  int n2 = right_end - mid;

  /* create temp arrays */
  Soyle  L[] = new Soyle[n1];
  Soyle  R[] = new Soyle[n2];

  /* Copy data to temp arrays L[]
   and R[] */
  for (i = 0; i < n1; i++)
    L[i] = arr[left_start + i];
  for (j = 0; j < n2; j++)
    R[j] = arr[mid + 1+ j];

  /* Merge the temp arrays back into
   arr[l..r]*/
  i = 0;
  j = 0;
  k = left_start;
  while (i < n1 && j < n2) {
    if (L[i].h <= R[j].h) {
      arr[k] = L[i];
      i++;
    } else {
      arr[k] = R[j];
      j++;
    }
    k++;
  }

  /* Copy the remaining elements of 
   L[], if there are any */
  while (i < n1)
  {
    arr[k] = L[i];
    i++;
    k++;
  }

  /* Copy the remaining elements of
   R[], if there are any */
  while (j < n2)
  {
    arr[k] = R[j];
    j++;
    k++;
  }



  //curr_size *= 2;
  
  if (left_start > n-1) {
    left_start = 0;
    curr_size *= 2;
    //curr_size *= 2;
    //return;
  }else {
    left_start += 2*curr_size;
  }
  delay(200);
}

public void visAlle() {
  tegnAlle();
}

void bytt(Soyle[] arr, int x, int y) {
  //println("BYTTER " + x + " og " + y);
  /*
  int tmp = arr[x].x;
   arr[x].x = arr[y].x;
   arr[y].x = tmp;
   */
  Soyle tmp = arr[x];
  arr[x] = arr[y];
  arr[y] = tmp;
}


void tegnAlle() {
  //  println("Tegner alle");
  clear();
  /*
   for(Soyle sl : arr) {
   sl.vis(); 
   }
   */

  for (int i = 0; i < arr.length; i++) {
    arr[i].x = s * i;
    //println("Tegner opp soyle på x " + arr[i].x + " med h " + arr[i].h);
    arr[i].vis();
  }
}

void mouseClicked() {
  println(" \n STATS: ");
  for (Soyle sl : arr) {
    print(sl.h + ", ");
  }
}


class Soyle implements Comparable<Soyle> {
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

  public int compareTo(Soyle annen) {
    //Soyle andre = (Soyle) annen;
    if (this.h > annen.h) {
      return 1;
    } else {
      return -1;
    }
  }
}
