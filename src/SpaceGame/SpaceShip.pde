class SpaceShip {
  int x, y, w, health, ammo, turretCount;
  PImage ship;


  SpaceShip(int x, int y) {
    this.x = x;
    this.y = y;
    w = 300;
    health = 100;
    ammo = 300;
    turretCount=1;
    ship = loadImage("Ship.png");
  }

  void display(int x, int y) {
    // TODO: copy and paste code from spaceship assignment
    rectMode(CENTER);


    
   
    // Draw spaceship
    image(ship, x, y, ship.width/3, ship.height/3);
    ship.resize(w, w);
  }

  void move(int x, int y ) {
    this.x=x;
    this.y=y;
  }

  void fire () {
    if (ammo > 0) {
      lasers.add(new Laser(mouseX-13, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+13, mouseY-10));
    }
  
    if (turretCount == 3) {
      lasers.add(new Laser(mouseX-13, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+13, mouseY-10));
    } else if (turretCount == 6) {
      lasers.add(new Laser(mouseX-13, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+13, mouseY-10));
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<r.diam) {
      return true;
    } else {
      return false;
    }
  }
boolean intersect(PowUp pu) {
    float d = dist(x, y, pu.x, pu.y);
    if (d<pu.diam) {
      return true;
    } else {
      return false;
    }
  }
  
  
  
  
  
  
  
}
