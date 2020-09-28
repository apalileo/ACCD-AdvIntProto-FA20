class Amph {
  float posX;
  float posY;
  float velX;
  float velY;
  int eatenFood;
  boolean adult;
  color amphColor;
  float size;


  Amph () {
    posX = random(0, width);
    posY = random(0, height);
    velX = random(1, 2);
    velY = random(1, 2);
    eatenFood = 0;
    adult = false;
    amphColor = color(150, 20, 200);
    size = 20;
  }

  void display() {
    fill (amphColor);
    circle (posX, posY, size);
  }

  void growUp() {
  }
}
