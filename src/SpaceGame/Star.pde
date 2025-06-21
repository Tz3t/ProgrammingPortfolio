class Star {
  int x, y, diam, speed;
  PImage img;

  Star (int x, int y) {
    this.x = x;
    this.y = y;
    diam = int(random(10, 20));
    speed = int(random(5, 10));
    img=loadImage("Star.png");
  }

  void display() {
    image(img, x, y, diam,diam);
    img.resize(diam,diam);
  }

  void move() {
    y=y + speed;
  }


  boolean reachedBottom() {
    if (y > height) {
      return true;
    } else {
      return false;
    }
  }
}
