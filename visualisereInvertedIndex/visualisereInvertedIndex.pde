import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;

List<String> allStrings = new ArrayList<String>();
List<Document> documents = new ArrayList<Document>();
List<String> terms = new ArrayList<String>();
List<Posting> postings = new ArrayList<Posting>();

int x = 0;
int s = 10;
int y = 0;

class Posting {
  int docId;
  int termFrequency;
}

class Document {
  private int documentId;
  private String content;
  Document(int docId, String fieldValue) {
    this.content = fieldValue;
    this.documentId = docId;
  }
  public String getContent() {
    return this.content;
  }
  public int getDocId() {
    return this.documentId;
  }

  public String toString() {
    return "<Document id:" + this.documentId + " content:" + this.content;
  }
}

void setup() {
  size(800, 800);

  File corpusFile = new File("/home/oliverrj/sketchbook/visualisereInvertedIndex/corpus.txt");
  Scanner scanner = null;
  try {
    scanner = new Scanner(corpusFile);
  }
  catch (Exception e) {
    e.printStackTrace();
    println("Fant ikke filen...");
    return;
  }



  int docIdCounter = 0;

  while (scanner.hasNextLine()) {
    String inp = scanner.nextLine();
    if (inp != "") {

      allStrings.add(inp);
      Document doc = new Document(docIdCounter, inp);
      documents.add(doc);

      docIdCounter++;
    }
  }

  scanner.close();


  println("Has made " + documents.size() + " documents.");
  println(documents.get(0).toString());
  println(documents.get(1).toString());
  println(documents.get(2).toString());
  println(documents.get(3).toString());
}

void draw() {
  println("Drawer");
  clear();
  //Assume there is always at least 10 docs
  for (int i = 0; i <  10; i++) {//documents.size(); i++) {
    Document doc = documents.get(i);
    int posX = s;
    int posY = i * s;
    rect(posX, posY, s*10, s*10);
    String str = doc.getContent();
    String truncatedValue = str.substring(0, 10);
    text(truncatedValue, posX, posY);
  }
  noLoop();
}
