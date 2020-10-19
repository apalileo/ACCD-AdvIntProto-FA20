class Fly {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Fly() {
    position = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topspeed = 5;
  }

  void update() {
    PVector amph = new PVector(mouseX, mouseY);
    acceleration = PVector.sub(amph, position);
    acceleration.normalize();
    acceleration.mult(-0.02);

    velocity.add(acceleration);
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
    image(flyImg, position.x, position.y, 15, 15);
  }
}
