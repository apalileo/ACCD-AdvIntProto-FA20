import processing.serial.*;

Serial myPort;

String inString = "";
String[] serialArray = new String[3];
int serialCount = 0;
float posX = 0;
float posY = 0;

void setup() {
  size(400,400);
  frameRate(60);
  background(225);
  noStroke();
  myPort = new Serial(this, Serial.list()[1], 9600);
  myPort.bufferUntil(10);
}

void draw() {
  if (serialArray[serialCount] != null) {
    posX = map(float(serialArray[1]), 0, 4095, 0, width);
    posY = map(float(serialArray[0]), 0, 4095, 0, height);
    rect(posX, posY, 2, 2);
    fill(100);
  }
}

void serialEvent(Serial p) {
  inString = p.readString();

  serialArray[serialCount] = inString;
  serialCount++;

  if (serialCount > 1) {
    println(serialArray[0]);
    serialCount = 0;
  }
}

void mouseClicked() {
  background(225);
}
