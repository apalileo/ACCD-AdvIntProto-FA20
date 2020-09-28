class Lettuce {
  float posX;
  float posY;
  int units = 3;
  int size = 8;
  color lettuceColor;

  Lettuce(float _x, float _y) {
    posX = _x;
    posY = _y;
    lettuceColor = color(0, 255, 0);
  }

  void display() {
    fill (lettuceColor);
    circle ( posX, posY, size );
  }
}
