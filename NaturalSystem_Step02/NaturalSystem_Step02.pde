
Amph myAmph;
Fly myFly;

ArrayList<Lettuce> lettuces = new ArrayList<Lettuce>();

//runs before the main loop
void setup() {
  size (500, 500);
  myAmph = new Amph();
  myFly = new Fly();
}

//this is the main loop
void draw() {
  background(100, 150, 200);
  myAmph.display();
  myAmph.move();
  myFly.display();
  myFly.move();

  for (Lettuce currentLettuce : lettuces) {
    currentLettuce.display();
  }
}

void mouseClicked() {
  lettuces.add(new Lettuce(mouseX, mouseY));
}
