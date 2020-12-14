class Point {
  PVector position;
  PVector velocity;
  PVector acceleration;
  int maxForce;
  float maxSpeed;
  
  Point() {
    this.position = new PVector(random(width), random(height));
    this.velocity = PVector.random2D();
    this.velocity.setMag(random(2, 4));
    this.acceleration = new PVector();
    this.maxForce = 1;
    this.maxSpeed = speedValue;
  }

  void edges() {
    if (this.position.x > width) {
      this.position.x = 0;
    } else if (this.position.x < 0) {
      this.position.x = width;
    }
    if (this.position.y > height) {
      this.position.y = 0;
    } else if (this.position.y < 0) {
      this.position.y = height;
    }
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
    this.position.add(this.velocity);
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.maxSpeed);
    this.acceleration.mult(0);
  }

  void show() {
    colorMode(HSB, 360, 100, 100, 100);
    strokeWeight(8);
    stroke(colorValue, 100, 100, 50);
    point(this.position.x, this.position.y);
  }
}
