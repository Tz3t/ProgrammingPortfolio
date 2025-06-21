
class Rock {
  int x, y, diam, health, speed;
  PImage rock;

  Rock (int x, int y) {
    this.x = x;
    this.y = y;
    diam = int(random(50, 150));
    health = diam;
    speed = int(random(5, 10));
    rock=loadImage("Rock.png");
  }

  void display() {
    image(rock, x, y, diam, diam);
    rock.resize(1000, 1000);
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
