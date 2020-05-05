import processing.sound.*;

boolean set = false;

SoundFile ding;

int mode = 0;

block l;
block r;
puck p;

int lScore;
int rScore;

int f = 0;

float angle = 3 * PI / 4;

float ai;

void batHit() {
  if ((p.pos.x - (p.r / 2) >= l.pos.x) && (p.pos.x - (p.r / 2) <= l.pos.x + (l.w / 2)) && (p.pos.y <= l.pos.y + (l.h / 2)) && (p.pos.y >= l.pos.y - (l.h / 2))) {
    float diff = p.pos.y - l.pos.y;
    angle = map(diff, -l.h / 2, l.h / 2, -PI / 4, PI / 4);
    p.incSpeed(angle);
    ai = pongAI();
  }
  
  if ((p.pos.x - (p.r / 2) <= r.pos.x) && (p.pos.x + (p.r / 2) >= r.pos.x - (r.w / 2)) && (p.pos.y <= r.pos.y + (r.h / 2)) && (p.pos.y >= r.pos.y - (r.h / 2))) {
    float diff = p.pos.y - r.pos.y;
    angle = map(diff, -r.h / 2, r.h / 2, 5 * PI / 4, 3 * PI / 4);
    p.incSpeed(angle);
    ai = height / 2;
  }
}

void keyCheck() {
  if (keyPressed) {
    f = 1;
    
    if (key == 'w') {
      l.moveUp();
    }
    if (key == 's') {
      l.moveDn();
    }
    if (mode == 1) {
      if (key == 'i') {
        r.moveUp();
      }
      if (key == 'k') {
        r.moveDn();
      }
    }
  }
}

void scoring() {
  if (p.pos.x - p.r / 2 < 0) {
    rScore += 1;
    angle = 3 * PI / 4;
    p = new puck(angle);
    ding.play();
  }
    
  if (p.pos.x + p.r / 2 > width) {
    lScore += 1;  
    angle = PI / 4;
    p = new puck(angle);
    ai = pongAI();
    ding.play();
  }
}

void checkWin() {
  if (lScore == 5) {
    noLoop();
    fill(255);
    textSize(100);
    text("Player 1 wins", width / 3, height / 2);
  }
  
  if (rScore == 5) {
    noLoop();
    fill(255);
    textSize(100);
    if (mode == 1)
      text("Player 2 wins", width / 3, height / 2);
    if (mode == 2)
      text("AI wins", 2 * width / 5, height / 2);
  }
}

void settings() {
  fullScreen();
}

void setup () {
  ding = new SoundFile(this, "ding.mp3");
  
  l = new block(width / 16);
  r = new block(15 * width / 16);
  p = new puck(angle);
  
  lScore = 0;
  rScore = 0;
}

void mousePressed() {
  set = true;
  
  if (mouseX < width / 2)
    mode = 1;
  else
    mode = 2;
  
  loop();
}

void draw() {
  background(180, 245, 230);
    
  fill(255);
  textSize(50);
  text(lScore, width / 50, height / 16);
  text(rScore, 48 * width / 50, height / 16);
  
  if (!set) {
    fill(255);
    l.show();
    r.show();
    p.show();
  
    fill(255);
    textSize(35);
    text("Player 1 vs Player 2", 2 * width / 10, height / 2);
    text("Player vs AI", 7 * width / 10, height / 2);
  
  } else {    
    if (f == 0) {
      fill(255);
      textSize(35);
      
      if (mode == 1) {
        text("Press w-s for Player 1", 2 * width / 10, height / 2);
        text("Press i-k for Player 2", 6 * width / 10, height / 2);
      } else if (mode == 2) {
        text("Press w-s for Player", 4 * width / 10, height / 2);
      }
    }
    
    keyCheck();
    
    p.update();
    batHit();
    
    l.show();
    r.show();
    p.show();
    
    if (p.xSpeed < 0)
      ai = height / 2;
    
    if (mode == 2)
      r.moveTo(ai);  
    
    scoring();
    checkWin();
    
    //textSize(10);
    //text(angle, 1800, 1000);
    //text(l.pos.y / height, 1800, 1010);
    //text(r.pos.y / height, 1850, 1010);
    //text(p.pos.x, 1800, 1020);
    //text(p.pos.y, 1850, 1020);
  }
}
