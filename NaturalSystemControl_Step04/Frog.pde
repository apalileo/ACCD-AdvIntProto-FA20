class Frog {
  float size;
  float radius;
  PVector velocity;
  PVector position;

  Frog() {
    position = new PVector(width/2, height/2);
    size = 50;
  }

  PVector repel(Fly m) {
    PVector force = PVector.sub(position, m.position);
    float d = force.mag();
    d = constrain(d, 0.5, 2.0);
    force.normalize();
    force.mult(-0.03);                                
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
