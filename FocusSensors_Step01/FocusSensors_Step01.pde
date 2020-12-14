// Based on Daniel Shiffman's Flocking Boids code https://editor.p5js.org/codingtrain/sketches/ry4XZ8OkN

Point[] group;

float alignValue = .5;
float cohesionValue = 0.8;
float separationValue = 1;
float speedValue = 4;
float colorValue = 125;

void setup() {
  size(800, 450);
  int n = 200;
  group = new Point[n];
  for (int i = 0; i < n; i++) {
    group[i] = new Point();
  }
}

void draw() {
  background(0);
  for (Point point : group) {
    point.edges();
    point.group(group);
    point.update();
    point.show();
  }
}
