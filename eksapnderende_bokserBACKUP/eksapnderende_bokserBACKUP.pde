ArrayList<Boks> bokser = new ArrayList<Boks>();

int s = 10;
int n = 100;
int f;// = width / n;
int margin = 100;//100;

ArrayList<Boks> o = new ArrayList<Boks>();
ArrayList<Boks> u = new ArrayList<Boks>();
ArrayList<Boks> v = new ArrayList<Boks>();
ArrayList<Boks> h = new ArrayList<Boks>();

ArrayList[] arr =  {o, u, v, h};

ArrayList<Boks> kanter = new ArrayList<Boks>();

void setup() {
  size(800, 800);
  //fullScreen();
  /*
  pixelDensity(2);
  displayDensity(2);
  */
  //init();
  f = (height - (2*margin)) / n;
  //s = ((height - (2*margin))/f)*1;
  
  for(int i = 0; i < n; i++) {
      
      //ny.str = f;
      Boks ln = new Boks(margin - s, margin + i*f);
      ln.farge = color(0, 0, 0);
      bokser.add(ln);
      v.add(ln);
      
      Boks rn = new Boks(width - margin - f - s, margin +  i*f);
      rn.farge = color(0, 0, 255);
      bokser.add(rn);
      h.add(rn);
      
      Boks ob = new Boks((margin + i*f)-s, margin);
      ob.farge = color(255, 0, 0);
      bokser.add(ob);
      o.add(ob);
      
      Boks nb = new Boks((margin + i*f)-s, width - margin - f);
      nb.farge = color(0, 255, 0);
      bokser.add(nb);
      u.add(nb);
      
      if(i == 0 || i == (n - 1)) {
        kanter.add(ln);
        kanter.add(rn);
        kanter.add(ob);
        kanter.add(nb);
        
      }
      
      //for(Boks b : bokser) {b.farge = color(255, 255, 255);}
  }
  /*
  println("Kanter: ");
  println(kanter.size());
  for(Boks b : kanter) {
    println(b);
  }
  */
  
}

void draw() {
  background(255);
  
  //oppdater();
  
  visAlle();
  tegnStreker();
  
  //bsOye();
  noLoop();
}

void bsOye() {
  
  ArrayList<Boks> nye = new ArrayList<Boks>();
   for(int i = 1; i < o.size(); i++){//Boks b : bokser) {
     /*
     int x, y;
     x = o.get(i).x;
     y = o.get(i).x;     
       Boks ny = new Boks(x, y);
       nye.add(ny);
       
       
       x = v.get(i).x;
       y = v.get(i).x;     
       ny = new Boks(x, y);
       nye.add(ny);
       
       */
       //stroke(255);
       
       line(o.get(i).x + s/2, o.get(i).y + s/2, v.get(n-i).x + s/2, v.get(n-i).y + s/2);
       line(u.get(i).x + s/2, u.get(i).y + s/2, h.get(n-i).x + s/2, h.get(n-i).y + s/2);
       
       //stroke(255, 0, 0);
       line(v.get(i).x + s/2, v.get(i).y + s/2, u.get(i).x + s/2, u.get(i).y + s/2);
       
       //stroke(0, 255, 0);
       line(h.get(i).x + s/2, h.get(i).y + s/2, o.get(i).x + s/2, o.get(i).y + s/2);
       
       
       
      
   }
   
   
}

void mousePressed() {redraw();}

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
  for(Boks check : lkanter) {
    
     if(check.x == b.x && check.y == b.y) {
       /*
        println("FANT EN MATCH: " + check + " == " + b);
        check.farge = color(255, 255, 255);
        */
        c = check;
        break;
     }
     c = null;
  }
  if(c == null) {
    //y
    if(int(random(2)) == 0) {
          b.y += oek;
       }else {
          b.y -= oek;
       }
  //x
   if(int(random(2)) == 0) {
          b.x += oek;
       }else {
          b.x -= oek;
       }
  }else {
    //y
    if(int(random(2)) == 0) {
        c.y += oek;
      b.y += oek;
     }else {
       c.y -= oek;
        b.y -= oek;
     }
  //x
   if(int(random(2)) == 0) {
      c.x += oek;
      b.x += oek;
     }else {
       c.x -= oek;
        b.x -= oek;
     }
  }
}


void tegnStreker() {
  
  for(ArrayList<Boks> l : arr) {
    for(int i = 0; i < l.size() - 1; i++) {
      Boks b = l.get(i);
      Boks neste = l.get(i + 1);
      
      stroke(b.farge);
      
      line(b.x + s/2, b.y + s /2, neste.x + s/2, neste.y + s/2);
    }
  }
  
  /*
   stroke(color(0, 0, 0));
  for(int i = 0; i < bokser.size() - 1; i++) {
    Boks b = bokser.get(i);
      Boks neste = bokser.get(i + 1);
      
     
      
      line(b.x + s/2, b.y + s /2, neste.x + s/2, neste.y + s/2);
  }
  
 */
}

void visAlle() {
  
  for(Boks b : bokser) {
    b.vis();
  }
  
}

class Boks {
  int x;// = int(random(width));
  int y;// = int(random(height));
  int str = s;
  
  color farge;
  
  Boks(int x, int y) {
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
