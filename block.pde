class block {
  PVector pos;
  float speed;
  float w;
  float h;
  
  block(float x) {
    pos = new PVector(x, height / 2);
    speed = 10;
    w = 50;
    h = 200;
  }
  
  void moveUp() {
    if (pos.y - h / 2 > 0)
      pos.y -= speed;
  }
  
  void moveDn() {
    if (pos.y + h / 2 < height)
      pos.y += speed;
  }
  
  void center() {
    if (pos.y > height / 2)
      moveUp();
    if (pos.y < height / 2)
      moveDn();
  }
  
  void moveTo(float y) {
    if (pos.y > y)
      moveUp();
    if (pos.y < y)
      moveDn();
  }
  
  void show () {
    noStroke();
    rect(pos.x - w / 2, pos.y - h / 2, w, h, 10);
  }
}
