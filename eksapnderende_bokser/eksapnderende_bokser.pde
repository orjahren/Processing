ArrayList<Boks> bokser = new ArrayList<Boks>();

int s = 10;
int n = 800;//Gode verdier: 10-200, 400, 800
float f;// = width / n;
int margin = 100;//100;

ArrayList<Boks> o = new ArrayList<Boks>();
ArrayList<Boks> u = new ArrayList<Boks>();
ArrayList<Boks> v = new ArrayList<Boks>();
ArrayList<Boks> h = new ArrayList<Boks>();

ArrayList[] arr =  {o, u, v, h};

ArrayList<Boks> kanter = new ArrayList<Boks>();

void setup() {
  size(800, 800);
  //frameRate(60);
  displayDensity(2);
  //pixelDensity(2);
  //fullScreen();
  init();
}


void draw() {
  background(255);
  //init();
  //oppdater();

  //markDups();
  //visAlle();

  //tegnStreker();

  bsOye();

  //linesToPoint(width/2, height/2);

  noLoop();
}

boolean opp = true;

void init() {
  reset();
  if (opp) {
    if (n > 20) {
      opp = false;
    } else {
      n++;
    }
  } else {
    if (n < 2) {
      opp = true;
    } else {
      n--;
    }
  }


  //n = 10;
  f = (height/n);//(height - (2*margin)) / n;
  //s = f;
  //s = height/f;
  //s = ((height - (2*margin))/f)*1;

  float bf = width/n;
  float hf = height/n;


  for (int i = 0; i <= n; i++) {

    //ny.str = f;
    Boks ln = new Boks(0, i * hf);
    ln.farge = color(0, 0, 0);
    bokser.add(ln);
    v.add(ln);

    Boks rn = new Boks(width, i*hf);
    rn.farge = color(0, 0, 255);
    bokser.add(rn);
    h.add(rn);

    Boks ob = new Boks(i*bf, 0);
    ob.farge = color(255, 0, 0);
    bokser.add(ob);
    o.add(ob);

    Boks nb = new Boks(i*bf, height);
    nb.farge = color(0, 255, 0);
    bokser.add(nb);
    u.add(nb);

    if (i == 0 || i == (n - 1)) {
      kanter.add(ln);
      kanter.add(rn);
      kanter.add(ob);
      kanter.add(nb);
    }   
    //for(Boks b : bokser) {b.farge = color(255, 255, 255);}
  }
  
  Boks hjorne = new Boks(width, height);
  bokser.add(hjorne);
}


void linesToPoint(float x, float y) {
  for (Boks b : bokser) {
    line(b.x, b.y, x, y);
  }
}


void reset() {
  bokser.clear();
  for (ArrayList<Boks> l : arr) {
    l.clear();
  }
}
void bsOye()  {

  /*
  line(u.get(0).x, u.get(0).y, o.get(n-1).x, o.get(n-1).y);
   line(o.get(0).x, o.get(0).y, u.get(n-1).x, u.get(n-1).y);
   
   lie(v.get(0).x, v.get(0).y, h.get(n-1).x, h.get(n-1).y);
   */

  for (int i = 1; i < o.size(); i++) {//Boks b : bokser) {
    //stroke(255);

    //stroke(255, 0, 0);
    line(o.get(i/2).x, o.get(i/2).y, v.get((v.size()-i)/2).x, v.get((v.size()-i)/2).y);

    //stroke(0, 255, 0);
    line(u.get((n/2) + i/2).x, u.get((n/2) + i/2).y, h.get((h.size()/2) + i/2 - i + (n/2)).x, h.get((h.size()/2) + i/2 - i + (n/2)).y);


    //stroke(0, 255, 255);     
    line(v.get((n/2) + i/2).x, v.get((n/2) + i/2).y, u.get(((i)/2)).x, u.get(((i)/2)).y);


    
     //stroke(0, 0, 0);
     line(h.get((i/2)).x, h.get(i/2).y, o.get((n/2) + i/2).x, o.get((n/2) + i/2).y);
     

  }

  /*
   for(int i = v.size()/2; i < v.size(); i++) {
   stroke(0, 0, 255); 
   line(v.get(i).x, v.get(i).y, u.get(u.size() - i).x, u.get(u.size() - i).y);
   
   stroke(0, 0, 0);
   line(h.get(n-i).x, h.get(n-i).y, o.get(i).x, o.get(i).y);
   
   }
   */
}

void mousePressed() {
  redraw();
}

void markDups() {
  for (Boks b : bokser) {
    for (Boks c : bokser) {
      if (c.x == b.x && c.y == b.y && c.farge != b.farge) {
        c.farge = color(255, 255, 255);
        b.farge = c.farge;
      }
    }
  }
}


void oppdater() {
  int ranfak = int(random(bokser.size() - 1));
  //ranfak = 1;
  int oek = int(random(10));

  Boks b = bokser.get(ranfak);
  //Boks b = kanter.get(ranfak);

  ArrayList<Boks> lkanter = new ArrayList<Boks>();
  lkanter = (ArrayList) bokser.clone();

  lkanter.remove(ranfak);
  Boks c = null;
  for (Boks check : lkanter) {

    if (check.x == b.x && check.y == b.y) {
      /*
        println("FANT EN MATCH: " + check + " == " + b);
       check.farge = color(255, 255, 255);
       */
      c = check;
      break;
    }
    c = null;
  }
  if (c == null) {
    //y
    if (int(random(2)) == 0) {
      b.y += oek;
    } else {
      b.y -= oek;
    }
    //x
    if (int(random(2)) == 0) {
      b.x += oek;
    } else {
      b.x -= oek;
    }
  } else {
    //y
    if (int(random(2)) == 0) {
      c.y += oek;
      b.y += oek;
    } else {
      c.y -= oek;
      b.y -= oek;
    }
    //x
    if (int(random(2)) == 0) {
      c.x += oek;
      b.x += oek;
    } else {
      c.x -= oek;
      b.x -= oek;
    }
  }
}


void tegnStreker() {
  /*
  for(ArrayList<Boks> l : arr) {
   for(int i = 0; i < l.size() - 1; i++) {
   Boks b = l.get(i);
   Boks neste = l.get(i + 1);
   
   stroke(b.farge);
   
   line(b.x + s/2, b.y + s /2, neste.x + s/2, neste.y + s/2);
   }
   }
   */
  stroke(color(0, 0, 0));
  for (int i = 0; i < bokser.size() - 1; i++) {
    Boks b = bokser.get(i);
    Boks neste = bokser.get(i + 1);



    line(b.x, b.y, neste.x, neste.y);
  }
}

void visAlle() {

  for (Boks b : bokser) {
    b.vis();
  }
}

class Boks {
  float x;// = int(random(width));
  float y;// = int(random(height));
  int str = s;

  color farge;

  Boks(float x, float y) {
    this.x = x;
    this.y = y;
    farge = color(255, 255, 255);
  }

  void vis() {
    fill(farge);
    rect(x, y, s, s);
  }
  @Override
    public String toString() {
    return "<" + x + ", " + y + ">";
  }
}
