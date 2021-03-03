String[] lines;
PFont font;
int counter;
float currentWidth, currentHeight;

void setup() {
  size(600, 800);
  lines = loadStrings("SelfDrawingSketch.pde");
  font = createFont("SourceCodePro-Regular", 12);
  textFont(font);
  stroke(0, 255, 0, 60);
  fill(255);
}

void draw() {
  background(30);
  counter = 0;
  currentWidth = 40;
  currentHeight = g.textLeading;
  for (int i=0; i<lines.length; i++) {
    textAlign(RIGHT);
    text(i+1, currentWidth-20, currentHeight);
    textAlign(LEFT);
    line(40, currentHeight, 40 + textWidth(lines[i]), currentHeight);
    for (int j=0; j<lines[i].length(); j++) {
      char c = lines[i].charAt(j);
      if (counter < frameCount) {
        text(c, currentWidth, currentHeight);
        counter++;
      }
      currentWidth += textWidth(c);
    }
    currentWidth = 40;
    currentHeight += g.textLeading;
  }
}
