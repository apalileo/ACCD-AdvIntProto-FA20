class Point {
  PVector position;
  PVector velocity;
  PVector acceleration;
  int maxForce;
  float maxSpeed;
  float r;

  Point(float x, float y) {
    this.position = new PVector(x, y);
    this.velocity = PVector.random2D();
    this.velocity.setMag(random(2, 4));
    this.acceleration = new PVector();
    this.maxForce = 1;
    this.maxSpeed = speedValue;
    this.r = random (12, 24);
  }

  PVector align(Point[] points) {
    int perceptionRadius = 50;
    PVector steering = new PVector();
    int total = 0;
    for (Point other : points) {
      float d = dist(this.position.x, this.position.y, other.position.x, other.position.y);
      if (other != this && d < perceptionRadius) {
        steering.add(other.velocity);
        total++;
      }
    }
    if (total > 0) {
      steering.div(total);
      steering.setMag(this.maxSpeed);
      steering.sub(this.velocity);
      steering.limit(this.maxForce);
    }
    return steering;
  }

  PVector separation(Point[] points) {
    int perceptionRadius = 50;
    PVector steering = new PVector();
    int total = 0;
    for (Point other : points) {
      float d = dist(this.position.x, this.position.y, other.position.x, other.position.y);
      if (other != this && d < perceptionRadius) {
        PVector diff = PVector.sub(this.position, other.position);
        diff.div(d * d);
        steering.add(diff);
        total++;
      }
    }

    if (total > 0) {
      steering.div(total);
      steering.setMag(this.maxSpeed);
      steering.sub(this.velocity);
      steering.limit(this.maxForce);
    }
    return steering;
  }

  PVector cohesion(Point[] points) {
    int perceptionRadius = 100;
    PVector steering = new PVector();
    int total = 0;
    for (Point other : points) {
      float d = dist(this.position.x, this.position.y, other.position.x, other.position.y);
      if (other != this && d < perceptionRadius) {
        steering.add(other.position);
        total++;
      }
    }
    for (Point other : points) {
      float d = dist(width/2, height/2, other.position.x, other.position.y);
      if (other != this && d < perceptionRadius) {
        steering.add(other.position);
        total++;
      }
    }
    if (total > 0) {
      steering.div(total);
      steering.sub(this.position);
      steering.setMag(this.maxSpeed);
      steering.sub(this.velocity);
      steering.limit(this.maxForce);
    }
    return steering;
  }

  void group(Point[] points) {
    PVector alignment = this.align(points);
    PVector cohesion = this.cohesion(points);
    PVector separation = this.separation(points);

    alignment.mult(alignValue);
    cohesion.mult(cohesionValue);
    separation.mult(separationValue);

    this.acceleration.add(alignment);
    this.acceleration.add(cohesion);
    this.acceleration.add(separation);
  }

  void update() {
    this.maxSpeed = speedValue;
    this.position.add(this.velocity);
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxSpeed);
    this.acceleration.mult(0);
    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    } else if (position.x < 0) {
      position.x = 0;
      velocity.x *= -1;
    }
    if (position.y > height - 30) {
      position.y = height - 30;
      velocity.y *= -1;
    } else if (position.y < 0) {
      position.y = 0;
      velocity.y *= -1;
    }
  }

  void show() {
    noFill();
    stroke(360);
    strokeWeight(2);
    ellipse(position.x, position.y, r, r);
  }
}
