import processing.serial.*;

Serial myPort;
String inString = "";
int lf = 10;

float px, py, px2, py2;
float angle, angle2;
float radius = 100;
float x, x2;

void setup() {
  size(1000, 500);
  myPort = new Serial(this, Serial.list()[1], 9600);
  myPort.bufferUntil(lf);
}

void draw() {
  background (200, 220, 230);
  stroke(100);
  noFill();
  ellipse(200, 250, radius*2, radius*2);

  float frequency = map(float(inString), 0, 4095, 2, 10);

  // Rotates rectangle around circle
  px = 200 + cos(radians(angle))*(radius);
  py = 250 + sin(radians(angle))*(radius);
  fill(0);

  ellipse (int(px), int(py), 5, 5);
  stroke(100);
  line(200, 250, px, py);
  stroke(100);

  // Keep reinitializing to 0, to avoid
  // flashing during redrawing
  angle2 = 0;

  // Draw static curve - y = sin(x)
  for (int i = 0; i< width; i++) {
    px2 = 200 + cos(radians(angle2))*(radius);
    py2 = 250 + sin(radians(angle2))*(radius);
    point(200+radius+i, py2);
    angle2 -= frequency;
  }

  // Send small ellipse along sine curve
  // to illustrate relationship of circle to wave
  noStroke();
  ellipse(200+radius+x, py, 5, 5);
  angle -= frequency;
  x+=1;

  // When little ellipse reaches end of window,
  // set the variables back to 0
  if (x >= width-300) {
    x = 0;
    angle = 0;
  }

  // Draw dynamic line connecting circular path with wave
  stroke(100);
  line(px, py, 200+radius+x, py);

  // Output calculations to screen
  //text("y = sin x", 35, 185);
  //text("px = " + px, 105, 185);
  //text("py = " + py, 215, 185);
}

void serialEvent(Serial p) {
  inString = p.readString();
}
