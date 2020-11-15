var currentR, previousR; //counters
var mouseParticle, keyboardParticle; //assignments for the two pixels
var inMouseData, inKeyboardData; //data from the APIs
var mouseSize = 10; //base dimensions for mouse pixels
var keyboardSize = 10; //base dimensions for keyboard pixels
var mouseColor = 320; //sets mouse pixel hue to magenta
var keyboardColor = 185; //sets keyboard pixel hue to cyan
var mouseAlph = 0; //starts mouse pixel alpha at zero
var keyboardAlph = 0; //starts keyboard pixel alpha at zero

function setup() {
  createCanvas(1080, 1080);
  colorMode(HSB);

  currentR = 0;
  previousR = 0;

  mouseParticle = new mParticle(width / 2, height / 2, mouseSize);
  keyboardParticle = new kParticle(width / 2, height / 2, keyboardSize);
  background(0);
}

function draw() {
  currentR = millis() % 1000;
  if (currentR < previousR) {
    inKeyboardData = loadJSON(apiKeyboardURL, parseKeyboardData, handleErrors);
    inMouseData = loadJSON(apiMouseURL, parseMouseData, handleErrors);
  }
  previousR = currentR;

  mouseParticle.update();
  mouseParticle.show();
  keyboardParticle.update();
  keyboardParticle.show();
}

function parseMouseData(JSONdata) {
  var inMouse = parseInt(JSONdata.result);
  mouseSize = map(inMouse, 226, 450, 10, 30, true);
  console.log("Mouse: " + inMouse);
  if (inMouse > 226) {
    mouseAlph = 0.1;
  } else {
    mouseAlph = 0;
  }
}

function parseKeyboardData(JSONdata) {
  var inKeyboard = parseInt(JSONdata.result);
  keyboardSize = map(inKeyboard, 116, 800, 10, 30, true);
  console.log("Keyboard: " + inKeyboard);
  if (inKeyboard > 116) {
    keyboardAlph = 0.1;
  } else {
    keyboardAlph = 0;
  }
}

function handleErrors(Error) {
  console.log("WE ENCOUNTERED AN ERROR: " + Error);
}