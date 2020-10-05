class Lettuce {
  float posX;
  float posY;
  int units = 3;
  int size = 24;
  color lettuceColor;

  Lettuce(float _x, float _y) {
    posX = _x;
    posY = _y;
    lettuceColor = color(0, 255, 0);
  }

  void display() {
    image (lettuceImg, posX, posY, size, size);
  }
}
