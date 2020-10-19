class Frog {
  float size;
  float radius;
  PVector velocity;
  PVector position;
  boolean tongue;

  Frog() {
    position = new PVector(width/2, height/2);
    size = 50;
  }

  PVector repel(Fly m) {
    PVector force = PVector.sub(position, m.position);
    float distance = force.mag();
    distance = constrain(distance, 1.0, 10.0);
    force.normalize();
    force.mult(-0.05);                                
    return force;
  }

  void update() {
    velocity = new PVector(potX, potY);
    position.add(velocity);

    if ((position.x+size > width) || (position.x < 0)) {
      potX *= -1;
    }
    if ((position.y+size > height) || (position.y < 0)) {
      potY *= -1;
    }
  }

  void display() {
    image (frogImg, position.x, position.y, size, size);
  }
}
