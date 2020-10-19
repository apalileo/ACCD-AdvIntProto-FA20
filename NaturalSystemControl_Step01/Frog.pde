class Frog {
  PVector position;
  PVector velocity;
  float topspeed;
  int eatenFood;
  float size;
  boolean tongue;

  Frog() {
    position = new PVector(width/2, height/2);
    topspeed = 3;
    size = 30;
    tongue = false;
  }

  void update() {
    velocity = new PVector(potX, potY); 
    velocity.limit(topspeed);
    position.add(velocity);

    if ((position.x+15 > width) || (position.x < 0)) {
      velocity.x *= -1;
    }
    if ((position.y+15 > height) || (position.y < 0)) {
      velocity.y *= -1;
    }
  }

  void display() {
    image(frogImg, position.x, position.y, size, size);
  }
}
