//Finally got the distance measurement between Frog and Fly using .dist()
//Frog can eat Fly with button press

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
int flyCounter = 0;
int frogCounter = 0;
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

  myFrog.display();
  myFrog.update();
  myFrog.tongue = false;
  frogCounter++;
  flyCounter++;

  if (flyCounter == addFly) {
    for (int i = 0; i < flies.length; i++) {
      if (flies[i] == null) {
        flies[i] = new Fly(15, random(width), random(height));
        break;
      }
    }
    flyCounter = 0;
  }

  for (int i = 0; i < flies.length; i++) {
    if (flies[i] != null) {

      PVector force = myFrog.repel(flies[i]);
      flies[i].applyForce(force);
      flies[i].update();
      flies[i].display();  

      float dist = myFrog.position.dist(flies[i].position);

      if (button) {
        if (dist <= myFrog.size * 2 && myFrog.tongue == false) {
          println(dist);
          line (myFrog.position.x, myFrog.position.y, flies[i].position.x, flies[i].position.y);
          strokeWeight(8);
          stroke(200, 20, 20);
          myFrog.tongue = true;
          myFrog.size += 2;
          flies[i] = null;
          //myFrog.eatenFood ++;
          println("Frog size UP: " + myFrog.size);
        }
      }
    }
  }

  if (frogCounter == 480) {
    myFrog.size -= 2;
    println("Amph size DOWN: " + myFrog.size);
    frogCounter = 0;
  }
}

void serialEvent(Serial p) {
  inString = p.readString();

  if (inString != null) {
    String[] data = split(trim(inString), ",");
    //printArray(data);

    if (data.length == 3) {
      button = boolean(data[0]);
      potX = map(float(data[1]), 0, 4095, -2, 2);
      potY = map(float(data[2]), 0, 4095, 2, -2);
    }
  }
}
