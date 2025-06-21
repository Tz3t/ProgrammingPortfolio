// Charles Madsen|  Nov 7 2023 | Calculator

class Button {
  // Button location and size
  float x;
  float y;
  float w;
  float h;
  char text;
  // Is the button on or off?
  boolean on, isNum;

  // Constructor initializes all variables
  Button(float tempX, float tempY, float tempW, float tempH, char text, boolean isNum) {
    rectMode(CENTER);
    x  = tempX;
    y  = tempY;
    w  = tempW;
    h  = tempH;
    this.text = text;
    this.isNum = isNum;
    on = false;  // Button always starts as off
  }

  void hover() {
    if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
      fill(200);
      on = true;
    } else {
      fill(255);
      on = false;
    }
  }
  void display() {
    rect(x, y, w, h, 7);
    textAlign(CENTER);
    textSize(25);
    fill(0);
    if(text == 'V') {
      textSize(20);
      text("COS", x, y + 8);
    } else {
      text(text, x, y + 8);
    }
  }
}
