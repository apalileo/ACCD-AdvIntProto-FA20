//Incorporating Serial control to my Natural System

import processing.serial.*;

Serial myPort;
int lf = 10;
String inString = "";
float potX;
float potY;
boolean button;

Frog myFrog;
Fly[] flies = new Fly[6];
int addFly = int(random(120, 480));
int frameCounter = 0;
PImage flyImg;
PImage frogImg;
PImage gravelImg;
PImage waterImg;


void setup() {
  size (1000, 500);
  frameRate(60);

  myPort = new Serial(this, Serial.list()[1], 9600);
  myPort.bufferUntil(lf);

  myFrog = new Frog();
  flyImg = loadImage("Fly.png");
  frogImg = loadImage("Frog.png");
  gravelImg = loadImage("Gravel.png");
  waterImg = loadImage("Water.png");
}

void draw() {
  background (0);
  image (gravelImg, 0, 0);
  image (waterImg, 0, 0);
  
  println(myFrog.position);

  myFrog.update();
  myFrog.display();
  myFrog.tongue = false;

  frameCounter++;

  if (frameCounter == addFly) {
    for (int i = 0; i < flies.length; i++) {
      if (flies[i] == null) {
        flies[i] = new Fly();
        break;
      }
    }
    frameCounter = 0;
    addFly = int(random(120, 240));
  }

  for (int i = 0; i < flies.length; i++) {
    if (flies[i] != null) {
      flies[i].update();
      flies[i].display();
    }
  }
}

void serialEvent(Serial p) {
  inString = p.readString();

  if (inString != null) {
    String[] data = split(trim(inString), ",");

    if (data.length == 3) {
      button = boolean(data[0]);
      potX = map(float(data[1]), 0, 4095, -5, 5);
      potY = map(float(data[2]), 0, 4095, 5, -5);
    }
  }
}
