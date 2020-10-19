class Frog {
  float mass;
  float radius;
  PVector position;

  Frog() {
    position = new PVector(width/2, height/2);
    mass = 4;
    radius = mass * 3;
  }

  PVector repel(Fly m) {
    PVector force = PVector.sub(position, m.position);
    float d = force.mag();
    d = constrain(d, 5.0, 10.0);
    force.normalize();
    force.mult(-0.02);                                
    return force;
  }

  void display() {
    ellipseMode(CENTER);
    stroke(0);
    fill(0);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
}
