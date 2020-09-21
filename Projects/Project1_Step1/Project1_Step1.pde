float posX = 100.0;
float posY = 100.0;
float speedX =3;
//boolean dirX = true; //true means left

//runs before the main loop
//in preparation
void setup(){
  size(500,700);
}


//this is the main loop
void draw(){
  background(120, 110, 110);
  circle(posX, posY, 100);
  
  if (posX >= width || posX <= 0 ){
    //dirX = !dirX;
    speedX = speedX *-1;
  }
  
  posX = posX + speedX;
}
