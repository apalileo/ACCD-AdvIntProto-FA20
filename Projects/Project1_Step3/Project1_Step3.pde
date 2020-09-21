float posX = 100.0;
float posY = 100.0;
float velX = 3;
float velY = 3;
float radius = 50;
float wildCard = 0;
float pV = 0;

//runs before the main loop
//in preparation
void setup(){
  size(500,700);
}


//this is the main loop
void draw(){
  background(120, 80, 140);
  circle(posX, posY, radius * 2);
  
  float cV = millis() % 2000;
  if ( pV > cV ){
    wildCard = random(-3, 3);
    velX *= wildCard;
    println(wildCard);
  }
  
  if (posX + radius >= width || posX - radius <= 0 ){
    velX *= -1;
  }
  posX += velX;
  
  if (posY + radius >= height || posY - radius <= 0 ){
    velY *= -1;
  }
  posY += velY;
  
  pV = cV;
}
