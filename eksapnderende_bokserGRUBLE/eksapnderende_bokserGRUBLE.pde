ArrayList<Boks> bokser = new ArrayList<Boks>();
ArrayList<Boks> o = new ArrayList<Boks>(); //over
ArrayList<Boks> u = new ArrayList<Boks>(); //under
ArrayList<Boks> v = new ArrayList<Boks>(); //venstre
ArrayList<Boks> h = new ArrayList<Boks>(); //høyre


int s = 10; //størrelse på boksene. Uviktig variabel
int n = 800;//Gode verdier: {[10, 200], 400, 800}
float f;

void setup() {
  size(800, 800);
  //frameRate(60);
  displayDensity(2);
  //pixelDensity(2);
  //fullScreen();
  f = (height/n);

  //høyde-faktor og bredde-faktor for å liksom skulle la programmet funke på ikke-kvadratiske lærett(funker ikke(enda))
  float bf = width/n;
  float hf = height/n;

  for (int i = 0; i <= n; i++) {

    //left nedover
    Boks ln = new Boks(0, i * hf);
    ln.farge = color(10, 100, 100);
    bokser.add(ln);
    v.add(ln);

    //right nedover
    Boks rn = new Boks(width, i*hf);
    rn.farge = color(0, 0, 255);
    bokser.add(rn);
    h.add(rn);

    //oppe bortover
    Boks ob = new Boks(i*bf, 0);
    ob.farge = color(255, 0, 0);
    bokser.add(ob);
    o.add(ob);

    //nede bortover
    Boks nb = new Boks(i*bf, height);
    nb.farge = color(0, 255, 0);
    bokser.add(nb);
    u.add(nb);
  }
}


void draw() {
  background(255);
  
  visAlle(); 

  tegnFauxSirkel(true);//color(0, 0, 0));

  stroke(color(0));
  //linesToPoint(width/2, height/2);
  
  
  noFill();
  stroke(color(0));
  //circle(height/2, width/2, width);


  noLoop();
}

void linesToPoint(float x, float y) {
  for (Boks b : bokser) {
    line(b.x, b.y, x, y);
  }
}

void tegnFauxSirkel(color farge) {
   stroke(farge);
   tegnFauxSirkel(false);
}

void tegnFauxSirkel() {tegnFauxSirkel(false);}

void tegnFauxSirkel(boolean farger)  {

  if(farger) {
    
    for (int i = 1; i < n; i++) {
      //topp mot venstre // RØD
      stroke(o.get(0).farge);
      line(o.get(i/2).x, o.get(i/2).y, v.get((v.size()-i)/2).x, v.get((v.size()-i)/2).y);
  
      //venstre mot bunn // INDIGO
      stroke(v.get(0).farge);     
      line(v.get((n/2) + i/2).x, v.get((n/2) + i/2).y, u.get(((i)/2)).x, u.get(((i)/2)).y);
  
      //bunn mot høyre // GRØNN
      stroke(u.get(0).farge);
      //line(u.get((n/2) + i/2).x, u.get((n/2) + i/2).y, h.get((h.size()/2) + i/2 - i + (n/2)).x, h.get((h.size()/2) + i/2 - i + (n/2)).y);
      line(u.get((n/2) + i/2).x, height, width, h.get((h.size()/2) - (i/2)  + (n/2)).y);
  
      //høyre mot topp // BLÅ
       stroke(h.get(0).farge);
       line(h.get((i/2)).x, h.get(i/2).y, o.get((n/2) + i/2).x, o.get((n/2) + i/2).y);
  
  
    }
  }else {
     for (int i = 1; i < n; i++) {
      //topp mot venstre // RØD
      line(o.get(i/2).x, o.get(i/2).y, v.get((v.size()-i)/2).x, v.get((v.size()-i)/2).y);
  
      //venstre mot bunn // INDIGO
      line(v.get((n/2) + i/2).x, v.get((n/2) + i/2).y, u.get(((i)/2)).x, u.get(((i)/2)).y);
  
      //bunn mot høyre // GRØNN
      line(u.get((n/2) + i/2).x, height, width, h.get((h.size()/2) - (i/2)  + (n/2)).y);
  
      //høyre mot topp // BLÅ
       line(h.get((i/2)).x, h.get(i/2).y, o.get((n/2) + i/2).x, o.get((n/2) + i/2).y);
    } 
  }
}

void visAlle() {
  for (Boks b : bokser) {
    b.vis();
  }
}

class Boks {
  float x;
  float y;
  int str = s;

  color farge;

  Boks(float x, float y) {
    this.x = x;
    this.y = y;
    farge = color(0, 0, 0);
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
