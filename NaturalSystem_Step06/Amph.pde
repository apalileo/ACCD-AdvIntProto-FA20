class Amph {
  float posX;
  float posY;
  float velX;
  float velY;
  int eatenFood;
  boolean adult;
  color amphColor;
  float size;
  float wildCard = 0;
  float pV = 0;
  boolean tongue;

  Amph () {
    posX = random(size, width - size);
    posY = random(size, height - size);
    velX = random(1, 2);
    velY = random(1, 2);
    eatenFood = 0;
    adult = false;
    tongue = false;
    amphColor = color(150, 20, 200);
    size = 30;
  }

  void display() {
    if (adult == false){
      image (tadpoleImg, posX, posY, size, size);
    }
    else{
      image (frogImg, posX, posY, size, size);
    }
  }

  void growUp() {
    if (eatenFood >= 6){
      adult = true;
    }
  }

  void move() {
    float cV = millis() %2000;
    if ( pV > cV ) {
      wildCard = random (-1, 1);
      velX += wildCard;
      velY += wildCard;
    }

    if (posX + size >= width || posX <= 0) {
      velX *= -1;
    }
    posX += velX;
    if (posY + size >= height || posY <= 0) {
      velY *= -1;
    }
    posY += velY;

    pV = cV;
  }
}
