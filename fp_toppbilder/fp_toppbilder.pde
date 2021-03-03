void setup() {
  size(820, 312);
  displayDensity(2);
}


final int ranfak = 0;//15;
void draw() {

  for (int it = 0; it < height; it++) {
    for (int i = 0; i < width / 2; i++) {

      //fill(random(255), random(255), random(255));
      //fill((255-(i % 255))*f, (255-(i % 255))*f, (255-(i % 255))*f);

      noStroke();

      float fak = (255-i) % (255);

      //fak = ((i*f) / 255) % 255;


      fill(fak, fak, fak);


      if (int(random(ranfak)) == 1) {
        fill(random(255));//, random(255), random(255));
      }

      circle(i, it, 1);

      rect(i, it, 1, 1);
    }

    for (int i = width; i >= width / 2; i--) {

      //fill(random(255), random(255), random(255));
      //fill((255-(i % 255))*f, (255-(i % 255))*f, (255-(i % 255))*f);

      noStroke();

      float fak = (255 - ((width) - i)) % (255);

      //fak = ((i*f) / 255) % 255;


      fill(fak, fak, fak);

      if (int(random(ranfak)) == 1) {
        fill(random(255));//, random(255), random(255));
      }



      circle(i, it, 1);

      rect(i, it, 1, 1);
    }
  }

  
  //fill(255);
  //circle(width/2, height/2, 250);

  noLoop();
  tegnSirkel(height/2);
  println("DONE");
  
  save("Exoprt av sketch 21.02.21");
}

void tegnSirkel(float rad) {
  boolean ferdig = false;
  
  fill(255, 0, 0);
  stroke(255);
   translate(width/2, height/2);
  
   for(int i = 0; i < rad*2; i++) {
      float y = -rad + (i*2*rad)/(rad/4);
      float x = sqrt(sq(rad) - sq(y));
      
      if(x == 0) continue;
      //stroke(random(255));
      
      float sf = (255-i) % 255;//random(255);
      
      stroke(sf);
      
      line(-x, y, x, y);
      
      line(x, y, -x, -y);
      
      line(-x, y, x, -y);
   }
   
   
   
   
   println("Har tegnet");
}

void mouseClicked() {
  noLoop();
}

class Boks {
  float x, y;
  Boks(float x, float y) {
    this.x = x;
    this.y = y;
  }
}
