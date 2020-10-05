Amph myAmph;

ArrayList<Lettuce> lettuces = new ArrayList<Lettuce>();
Fly[] flies = new Fly[6];
int frameCounter = 0;
int addFly = int(random(120, 240));
PImage flyImg;
PImage tadpoleImg;
PImage frogImg;
PImage lettuceImg;
PImage gravel;
PImage water;

//runs before the main loop
void setup() {
  size (1000, 500);
  frameRate(60);
  myAmph = new Amph();
  flyImg = loadImage("Fly.png");
  tadpoleImg = loadImage("Tadpole.png");
  frogImg = loadImage("Frog.png");
  lettuceImg = loadImage("Lettuce.png");
  gravel = loadImage("Gravel.png");
  water = loadImage("Water.png");
}

//this is the main loop
void draw() {
  background(0);
  image (gravel, 0, 0);
  image (water, 0, 0);


  myAmph.display();
  myAmph.move();
  myAmph.growUp();
  myAmph.tongue = false;

  for (Lettuce currentLettuce : lettuces) {
    currentLettuce.display();
  }

  for (int index = lettuces.size() - 1; index >= 0; index--) {
    Lettuce currentLettuce = lettuces.get(index);
    if (myAmph.adult == false && dist (myAmph.posX, myAmph.posY, currentLettuce.posX, currentLettuce.posY) <= myAmph.size * 2) {
      lettuces.remove(index);
      myAmph.eatenFood ++;
      myAmph.size += 2;
    }
  }

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

      if (myAmph.adult == true && myAmph.size < 70 && dist (myAmph.posX, myAmph.posY, flies[i].posX, flies[i].posY) <= myAmph.size * 3 && myAmph.tongue == false) {
        line (myAmph.posX, myAmph.posY, flies[i].posX, flies[i].posY);
        strokeWeight(8);
        stroke(200, 20, 20);
        myAmph.tongue = true;
        myAmph.size += 2;
        flies[i] = null;
        myAmph.eatenFood ++;
        println(myAmph.size);
      }
    }
  }
}

void mouseClicked() {
  lettuces.add(new Lettuce(mouseX, mouseY));
}
