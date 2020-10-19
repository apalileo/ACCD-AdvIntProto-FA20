//Rewriting code for "force"

Fly[] flies = new Fly[6];

Frog myFrog;

void setup() {
  size(640,360);
  myFrog = new Frog();
  for (int i = 0; i < flies.length; i++) {
    flies[i] = new Fly(4,random(width),random(height)); 
  }
}

void draw() {
  background(255);

  myFrog.display();

  for (int i = 0; i < flies.length; i++) {

    PVector force = myFrog.repel(flies[i]);
    flies[i].applyForce(force);
    flies[i].update();
    flies[i].display();
  }
}
