class Fly {
  float posX;
  float posY;
  float velX;
  float velY;
  float size;
  float wildCard = 0;
  float pV = 0;

  Fly () {
    posX = random(size, width - size);
    posY = random(size, height - size);
    velX = random(1, 2);
    velY = random(1, 2);
    size = 10;
  }

  void display() {
  
  image(flyImg, posX, posY, 15, 15);
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
