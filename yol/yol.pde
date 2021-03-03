void setup() {
  size(2628, 1000);
  //size(3280, 1248);
  displayDensity(2);
   rad = (height/2) - 50;
   //fullScreen();
}

float rad;
final int ranfak = 20;//15;
void draw() {
  //scale(300/72.0);
  noStroke();
  float fak = 0;
  fill(fak);
  background(0);
  for (int it = height; it < height; it++) {
    for (int i = 0; i < width ; i++) {
    
      fill(fak);
      
      if (int(random(ranfak)) == 1 && fak <= random(200)) {
        fill(random(255));//, random(255), random(255));
      }

      circle(i, it, 1);

      rect(i, it, 1, 1);
    }
  }

  
  //fill(255);
  //circle(width/2, height/2, 250);

  noLoop();
  tegnSirkel();
  //tegnStreker();
  
  
  println("DONE");
  
  //save("Exoprt av sketch 21.02.21 v5.png");
}

void tegnStreker(){
  stroke(255, 0, 0);
  int maal = width;
  for(int i = 0; i < height; i++) {
    
    if(i >= al.size()) return;
    println(i);
     float y = al.get(i);
     float x = sqrt(sq(rad) - sq(y));
     
     //line(width, i, x, y);
     for(float a = width; a > x; a--) {
        stroke(random(255), random(255), random(255));
        line(a, i, x, y);
     }
     line(width, i, x, y);
  }
  /*
  for(float y : al)  {
      println(y);
      //println( sqrt(sq(rad) - sq(y)));
      //println(y);
  }
  */
}

ArrayList<Float> al;

void tegnSirkel() {
  
  al = new ArrayList<Float>();
  ArrayList<Float> ax = new ArrayList<Float>();
  fill(255, 0, 0);
  stroke(255);
//   translate((width/2) + rad*2 - 50, height/2);
translate((width/2), height/2);
  
   for(int i = 0; i < rad*2; i++) {
      float y = -rad + (i*2*rad)/(rad/2);
      float x = sqrt(sq(rad) - sq(y));
      
      //if(x == 0) continue;
      //stroke(random(255));
      
      float sf = (255-i) % 255;//random(255);
      
      sf = (255-i) % 255;//random(255);
      stroke(sf);
      
      //stroke(random(255), random(255), random(255));
      
      line(-x, y, x, y);
      
      ax.add((x));
      
      //al.add(x);
      al.add(y);
      
      //line(-y, x, y, -x);
      //line(x, y, -x, -y);
      
      //line(-x, y, x, -y);
      
   }
   
   stroke(255, 0, 0);
   //stroke(255);
   for(int i = 0; i < al.size() - 1; i++) {
     
     
     float y1 = al.get(i);
     float x1 = sqrt(sq(rad) - sq(y1));
     
     float y2 = al.get(i + 1);
     float x2 = sqrt(sq(rad) - sq(y2));
     
     //line(x1, y1, x2, y2);
     //line(-x1, y1, -x2, y2);
     
     float y3;
     try {
       y3 = al.get(al.size()/2 - i );
     }catch(Exception e) {
        continue; 
     }
     float x3 = sqrt(sq(rad) - sq(y3));
     
     line(x1, y1, width/3 * x1, y3);

   }
      
   println("Har tegnet");
}
