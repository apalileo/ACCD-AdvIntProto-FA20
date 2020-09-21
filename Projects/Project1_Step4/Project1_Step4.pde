ArrayList<Thing> things = new ArrayList<Thing>();

float wildCard = 0;
float pV = 0;

//runs before the main loop
//in preparation
void setup() {
  size(500, 700);
}


//this is the main loop
void draw() {
  background(120, 80, 140);

  //float cV = millis() % 2000;
  //if ( pV > cV ) {
  //  wildCard = random(-3, 3);
  //  velX *= wildCard;
  //  println(wildCard);
  //}
  //pV = cV;
  
  for(Thing currentThing : things){
    currentThing.display();
    currentThing.move();
  }
  
}

void mouseClicked() {
  things.add(new Thing(mouseX, mouseY));
}
