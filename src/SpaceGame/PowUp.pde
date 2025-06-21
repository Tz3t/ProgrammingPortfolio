
class PowUp {
  int x, y, diam, speed, val;
  PImage PowUp;
  char type;

  PowUp (int x, int y) {
    this.x = x;
    this.y = y;
    diam = 60;
    speed = 5;
    int  rand = int(random(1, 4));
    if (rand == 1) {
      PowUp = loadImage("Ammo.png");
      val = 100;
      type = 'a';
    } else if (rand == 2) {
      PowUp = loadImage("Health.png");
      val=50;
      type = 'h';
    } else if (rand == 3) {
      PowUp = loadImage("Turret.png");
      
      val = 1;
      type = 't';
    }
  }


  void display() {
    image(PowUp, x, y, diam, diam);
    PowUp.resize(1000, 1000);
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
