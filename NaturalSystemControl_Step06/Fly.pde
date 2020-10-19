class Fly {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float size;

  Fly(float m, float x, float y) {
    size = m;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, size);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0.9);

    if ((position.x+15 > width) || (position.x < 0)) {
      velocity.x *= -1;
    }
    if ((position.y+15 > height) || (position.y < 0)) {
      velocity.y *= -1;
    }
  }

  void display() {
    image (flyImg, position.x, position.y, size, size);
  }
}
