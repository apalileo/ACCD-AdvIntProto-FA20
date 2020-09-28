class Fly {
  float posX;
  float posY;
  float velX;
  float velY;
  color flyColor;
  float size;
  float wildCard = 0;
  float pV = 0;

  Fly () {
    posX = random(0, width);
    posY = random(0, height);
    velX = random(1, 2);
    velY = random(1, 2);
    flyColor = color(0, 20, 0);
    size = 10;
  }

  void display() {
    fill (flyColor);
    circle (posX, posY, size);
  }

  void growUp() {
  }

  void move() {
    float cV = millis() %600;
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
