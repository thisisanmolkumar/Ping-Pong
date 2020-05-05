float pongAI() {
  float y = (r.pos.x - p.pos.x) * tan(abs(angle));
  if (angle < 0) {
    if (y > p.pos.y) {
      float t = y - p.pos.y;
      int i = 0;
      
      while (t > height) {
        t = t - height;
        i++;
      }
      
      if (i % 2 == 0) {
        y = t;
      } else { 
        y = height - t;
      }
    } else {
      y = p.pos.y - y;
    }
    
    float rp = random(-r.h / 4, r.h / 4);
    return y + rp;
  } else if (angle == 0) {
    return height / 2;
  } else {
    if (y > height - p.pos.y) {
      float t = y - (height - p.pos.y);
      int i = 0;
      
      while (t > height) {
        t = t - height;
        i++;
      }
      
      if (i % 2 == 0) {
        y = height - t;
      } else {
        y = t;
      }
    } else {
      y = p.pos.y + y;
    }
    
    float rp = random(-r.h / 4, r.h / 4);
    return y + rp;
  }
}
