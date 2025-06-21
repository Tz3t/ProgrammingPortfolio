// Charles Madsen |sept 5 2023| TimeLine
PFont font;

void setup() {
  size(900, 400);
  font = loadFont("Papyrus-30.vlw");
}




void draw() {
  background(128);
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text("Historic Computer Systems", width/2, 60);
  textSize(25);
  text("by Charles Madsen", width/2, 105);


  //Timeline
  textFont(font);
  strokeWeight(3);
  line(100, 250, 800, 250);
  line(100, 245, 100, 255);
  line(800, 245, 800, 255);
  line(200, 245, 200, 255);
  line(400, 245, 400, 255);
  line(600, 245, 600, 255);
  textSize(20);
  text("1940", 100, 235);
  text("1955", 800, 235);


  histEvent("ENIAC", "1946 | John Mauchly | Calculate artillery firing tables", 150, 200, true);
  histEvent("72", "1946|dev1|purpose", 220, 300, false);
  histEvent("CSIRAC", "1946|Team led by Trevor Pearcey|Australias first digital computer", 350, 200, true);
  histEvent("Manchester Baby", "1948 | Frederic C. Williams, Tom Kilburn | first electronic stored-program computer", 420, 300, false);
  histEvent("Manchester MK1", "1949 | Victoria Uni of manchester | purpose", 550, 200, true);
  histEvent("EDSAC", "1949 | Maurice Wilkes | First electronic digital stored-program computer", 620, 300, false);
  histEvent("MicroProgramming", "1951|Maurice Wilkes|Allows base instruction set to be defined or extended by built in programs", 750, 200, true);
  histEvent("Ferranti Mk1", "1951 | Ferranti Ltd. | First commercially sold electronic stored program digital computer", 780, 300, false);
}

void histEvent(String title, String details, int x, int y, boolean top) {
  text(title, x, y);

  if (top == true) {
    line(x, y+10, x+20, y+50);
  } else {
    line(x, y-20, x+20, y-50);
  }
  if (mouseX > x-30 && mouseX < x+30 && mouseY > y-20 && mouseY < y+5) {
    fill(0);
    rectMode(CENTER);
    rect(width/2, 365, textWidth(details) +5, 25);
    fill(255);
    text(details, width/2, 370);
  }
}
