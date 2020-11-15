function mParticle(x, y) {
  this.x = x;
  this.y = y;

  this.update = function () {
    this.x += random(-mouseSize*1.5, mouseSize*1.5);
    this.y += random(-mouseSize, mouseSize);

    this.x = constrain(this.x, 0, width);
    this.y = constrain(this.y, 0, height);
  }

  this.show = function () {
    noStroke();
    fill(mouseColor, 100, 100, mouseAlph);
    ellipse(this.x, this.y, mouseSize*2, mouseSize);
  }
}

function kParticle(x, y) {
  this.x = x;
  this.y = y;

  this.update = function () {
    this.x += random(-keyboardSize*1.5, keyboardSize*1.5);
    this.y += random(-keyboardSize, keyboardSize);

    this.x = constrain(this.x, 0, width);
    this.y = constrain(this.y, 0, height);
  }

  this.show = function () {
    noStroke();
    fill(keyboardColor, 100, 100, keyboardAlph);
    rect(this.x, this.y, keyboardSize*2, keyboardSize);
  }
}