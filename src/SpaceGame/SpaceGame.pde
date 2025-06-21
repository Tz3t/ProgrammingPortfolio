// Charles Madsen | Nov 28 2023 | SpaceGame
import processing.sound.*;
SoundFile laser;
SpaceShip s1;
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowUp> powups = new ArrayList<PowUp>();
ArrayList<Star> stars = new ArrayList<Star>();

Timer rockTimer, puTimer,sTimer;
int score, level;
boolean play;

void setup() {
  //size(1200, 1200);
  fullScreen();
  play = false;
  laser = new SoundFile(this, "laser2.wav");
  rockTimer = new Timer(1*1000);
  rockTimer.start();
  puTimer = new Timer(5*1000);
  puTimer.start();
  s1 = new SpaceShip(mouseX, mouseY);
 sTimer = new Timer(20);
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);
    //add stars
   if (sTimer.isFinished()) {
      stars.add(new Star(int(random(width)), -100));
      sTimer.start();
   }
    //display star
    for (int i=0; i < stars.size(); i++) {
      Star s = stars.get(i);
      if (s.reachedBottom())
      {
        stars.remove(s);
      } else {
        s.display();
        s.move();
      }
    }
    if(frameCount % 1000 == 10) {
    level++;
    }
    //rock dis
    if (rockTimer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -100));
      rockTimer.start();
    }
    // PowerUp dis
    if (puTimer.isFinished()) {
      powups.add(new PowUp(int(random(width)), -100));
      puTimer.start();
    }
    //PowUps rendering
    for (int i=0; i < powups.size(); i++) {
      PowUp pu = powups.get(i);
      if (s1.intersect(pu)) {
        if (pu.type == 'a') {
          s1.ammo += pu.val;
        } else   if (pu.type == 'h') {
          s1.health += pu.val;
        } else   if (pu.type == 't') {
          s1.turretCount += pu.val;
        }
        powups.remove(pu);
      }
      if (pu.reachedBottom())
      {
        powups.remove(pu);
        score -= 100;
      } else {
        pu.display();
        pu.move();
      }
    }
    //ship
    s1.display(mouseX-s1.ship.width/6, mouseY-s1.ship.height/6 );
    s1.move(mouseX, mouseY);

    //rendering rocks
    for (int i=0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health -=r.diam;
        rocks.remove(r);
      }
      if (r.reachedBottom())
      {
        rocks.remove(r);
        score -= 100;
      } else {
        r.display();
        r.move();
      }
    }

 
    //Lasers
    for (int i=0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      //rock and laser colide
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          r.diam-=50;
          if (r.diam<50) {
            rocks.remove(r);
          }
          score+=100;
          lasers.remove(l);
        }
      }
      l.display();
      l.move();
      if (l.reachedTop()) {
        lasers.remove(i);
      }
    }



    //Scoreboard render
   
    infoPanel();
    if(s1.health<1) {
      gameOver();
  }
}
}

void infoPanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  fill(255);
  textSize(40);
  text("Score:" + score, 70, 35);
  text("Level:" + level, width-120, 35);
  text("Ammo:" + s1.ammo, width-700, 35);
  text("Health:" + s1.health, 800, 35);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(44);
  text("Welcome to SpaceGame", width/2, 200);
  text("By Charles Madsen", width/2, 250);
  textSize(60);
  text("Click to play...", width/2, 500);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(44);
  text("GameOver", width/2, 200);
  text("Score:" + score, width/2, 300);
  textSize(60);
  text("Thanks for playing", width/2, 500);
  noLoop();
}

void ticker() {
}

void mousePressed() {
  s1.fire();
  if (s1.ammo > 0) {
    laser.play();
    lasers.add(new Laser(mouseX-13, mouseY-10));
    lasers.add(new Laser(mouseX, mouseY));
    lasers.add(new Laser(mouseX+13, mouseY-10));


    if (s1.turretCount == 1) {
      lasers.add(new Laser(mouseX-13, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+13, mouseY-10));
      s1.ammo-= 3;
    } else if (s1.turretCount == 2) {
      lasers.add(new Laser(mouseX-20, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+20, mouseY-10));
      lasers.add(new Laser(mouseX-20, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+20, mouseY-10));
      s1.ammo-= 6;
    } else if (s1.turretCount == 3) {
      lasers.add(new Laser(mouseX-13, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+13, mouseY-10));
      lasers.add(new Laser(mouseX-20, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+20, mouseY-10));
      lasers.add(new Laser(mouseX-30, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+30, mouseY-10));
      s1.ammo-= 9;
    }
  }
}
void keyPressed() {
  s1.fire();
  if (s1.ammo > 0) {
    laser.play();
    lasers.add(new Laser(mouseX-13, mouseY-10));
    lasers.add(new Laser(mouseX, mouseY));
    lasers.add(new Laser(mouseX+13, mouseY-10));
    s1.ammo-= 3;
    


    if (s1.turretCount == 1) {
      lasers.add(new Laser(mouseX-13, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+13, mouseY-10));
      s1.ammo-= 3;
    } else if (s1.turretCount == 2) {
      lasers.add(new Laser(mouseX-20, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+20, mouseY-10));
      lasers.add(new Laser(mouseX-20, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+20, mouseY-10));
      s1.ammo-= 6;
    } else if (s1.turretCount == 3) {
      lasers.add(new Laser(mouseX-13, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+13, mouseY-10));
      lasers.add(new Laser(mouseX-20, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+20, mouseY-10));
      lasers.add(new Laser(mouseX-30, mouseY-10));
      lasers.add(new Laser(mouseX, mouseY));
      lasers.add(new Laser(mouseX+30, mouseY-10));
      s1.ammo-= 9;
    }
  }
}
