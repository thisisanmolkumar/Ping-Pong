class puck {
  PVector pos;
  float xSpeed;
  float ySpeed;
  float speed;
  float r;
  int yDir;
  
  puck(float angle) {
    pos = new PVector(width / 2, height / 2);
    speed = 5;
    yDir = 1;
    xSpeed = speed * cos(angle);
    ySpeed = yDir * speed * sin(angle);
    r = 50;
  }
  
  void show() {
    fill(100);
    noStroke();
    ellipse(pos.x, pos.y, r, r);
  }
  
  void update() {
    pos.x += xSpeed;
    
    if ((pos.y + r / 2 >= height) || (pos.y - r / 2 <= 0))
      yDir *= -1;
      
    ySpeed *= yDir; 
    pos.y += ySpeed;
  }
  
  void incSpeed(float angle) {
    speed += 1;
    
    xSpeed = speed * cos(angle);
    ySpeed = speed * yDir * sin(angle);
  }
}
