Amph myAmph;

ArrayList<Lettuce> lettuces = new ArrayList<Lettuce>();
Fly[] flies = new Fly[6];
int frameCounter = 0;
int addFly = int(random(120, 240));

//runs before the main loop
void setup() {
  size (1000, 500);
  frameRate(60);
  myAmph = new Amph();
}

//this is the main loop
void draw() {
  background(100, 150, 200);

  myAmph.display();
  myAmph.move();
  myAmph.growUp();
  myAmph.tongue = false;

  frameCounter++;

  if (frameCounter == addFly) {
    //flies.add(new Fly());


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
      flies[i].display();
      flies[i].move();     

      if (myAmph.adult == true && dist (myAmph.posX, myAmph.posY, flies[i].posX, flies[i].posY) <= myAmph.size * 3 && myAmph.tongue == false) {
        line (myAmph.posX, myAmph.posY, flies[i].posX, flies[i].posY);
        myAmph.tongue = true;
        myAmph.size += 2;
        flies[i] = null;
        myAmph.eatenFood ++;
        println(myAmph.eatenFood);
      }
    }
  }


  for (Lettuce currentLettuce : lettuces) {
    currentLettuce.display();
  }

  for (int index = lettuces.size() - 1; index >= 0; index--) {
    Lettuce currentLettuce = lettuces.get(index);
    if (myAmph.adult == false && dist (myAmph.posX, myAmph.posY, currentLettuce.posX, currentLettuce.posY) <= myAmph.size * 2) {
      lettuces.remove(index);
      myAmph.eatenFood ++;
      myAmph.size += 3;
    }
  }
}

void mouseClicked() {
  lettuces.add(new Lettuce(mouseX, mouseY));
}
