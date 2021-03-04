import java.util.ArrayList;

void setup() {
  size(800, 800);
  frameRate(10);

  bokser = new ArrayList<Boks>(f * f);
  ghosts = new ArrayList<Ghost>();
  
  f = width;///s;
  rader = f;
  kolonner = f;
  bokseMatrise = new Boks[rader][kolonner];

  for (int i = 0; i < f; i += s) {
    for (int j = 0; j < f; j += s) {
      Boks ny = new Boks(i, j);
      bokseMatrise[i][j] = ny;   
      bokser.add(ny);

      if (i == 0 || j == 0 || i == width - s || j  == height -s ) {
        ny.farge = 0;
      }
      
      if(int(random(10)) == 0) ny.farge = 0;
    }
  }

  Boks r = bokser.get(int(random(bokser.size())));
  while (r.farge == 0) {
    r = bokser.get(int(random(bokser.size())));
  }
  sp = new Spiller(r.x, r.y);
  bokser.add(sp);


  r = bokser.get(int(random(bokser.size())));
  while (r.farge == 0) {
    r = bokser.get(int(random(bokser.size())));
  }
  g = new Ghost(r.x, r.y);
  bokser.add(g);
}

Boks[][] bokseMatrise;
int rader, kolonner;
int s = 20;
int f;
Ghost g;
Spiller sp;
ArrayList<Boks> bokser;
ArrayList<Ghost> ghosts;
void draw() {
  for (Boks b : bokser) {
    fill(b.farge);
    rect(b.x, b.y, s, s);
  }

  if (g.x == sp.x && g.y == sp.y) {
    println("PACMAN SPISES");
    noLoop();
  }
  
  boolean gaattX = true;//false;
  boolean gaattY = true;//false;

  //ghosts movement
  if (g.x < sp.x && bokseMatrise[g.x + s][g.y].farge != 0) {
    g.x += s;
    gaattX = true;
  } else if (g.x > sp.x && bokseMatrise[g.x - s][g.y].farge != 0) {
    g.x -= s;
    gaattX = true;
  }else {
    g.x -= s;
    g.y += s;
  }

  if (!gaattX || g.y < sp.y && bokseMatrise[g.x][g.y + s].farge != 0) {
    g.y += s;
  } else if (!gaattX || g.y > sp.y && bokseMatrise[g.x][g.y -s].farge != 0) {
    g.y -= s;
  }
  
  //spillers movement
  if(int(random(2)) == 0 && sp.x + s < width) {
     sp.x += s; 
  }else if(sp.x - s > 0) {
    sp.x -= s;
  }
  
  
  if(int(random(1)) == 0 && sp.y + s < height) {
     sp.y += s; 
  }else if(sp.y - s > 0){
    sp.y -= s;
  }
}

void mouseClicked() {
   //g.x = int(random(width));
   //g.y = int(random(height));
}

class Boks {
  color farge;
  int x, y;
  Boks(int x, int y) {
    this.x = x;
    this.y = y;
    farge = color(200);
  }
}

class Spiller extends Boks {
  Spiller(int x, int y) {
    super(x, y);
    this.farge = color(255, 255, 0);
  }
}

class Sti extends Boks {
  Sti(int x, int y) {
    super(x, y);
    this.farge = color(0, 255, 0);
  }
}

class Ghost extends Boks {
  Ghost(int x, int y) {
    super(x, y);
    this.farge = color(255, 0, 0);
  }
}
