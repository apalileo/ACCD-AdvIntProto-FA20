function setup() {
createCanvas(windowWidth, windowHeight);
currentR = 0;
previousR = 0;

colorMode(HSB);
}

function draw() {
background(0);

//console.log(millis() % 1000);
currentR = millis() % 1000;
if (currentR < previousR) {
    inKeyboardData = loadJSON(apiKeyboardURL, parseKeyboardData, handleErrors);
    inMouseData = loadJSON(apiMouseURL, parseMouseData, handleErrors);
    // console.log(inKeyboardData);
    // console.log(inMouseData);
}

for (let i = 0; i < keyboardPixels.length; i++) {
    keyboardPixels[i].display();
    keyboardPixels[i].move();
}

for (let i = 0; i < mousePixels.length; i++) {
    mousePixels[i].display();
    mousePixels[i].move();
}

previousR = currentR;
}

function parseKeyboardData(JSONdata) {
let inKeyboard = parseInt(JSONdata.result);
keyboardResult = map(inKeyboard, 20, 50, 5, 100, true);
console.log("Keyboard: " + inKeyboard);
if (inKeyboard > 20) {
    newKeyboardPixel();
}
}

function parseMouseData(JSONdata) {
let inMouse = parseInt(JSONdata.result);
mouseResult = map(inMouse, 5, 40, 5, 100, true);
console.log("Mouse: " + inMouse);
if (inMouse > 5) {
    newMousePixel();
}
}

function handleErrors(Error) {
console.log("WE ENCOUNTERED AN ERROR: " + Error);
}

function newKeyboardPixel() {
let x = random(width);
let y = random(height);
let r = keyboardResult;
let kP = new keyboardPixel(x, y, r);
keyboardPixels.push(kP);
}

function newMousePixel() {
let x = random(width);
let y = random(height);
let r = mouseResult;
let kP = new mousePixel(x, y, r);
mousePixels.push(kP);
}

class keyboardPixel {
constructor(x, y, r) {
    this.x = x;
    this.y = y;
    this.r = r;
}

display() {
    noStroke();
    fill(185, 100, 100, 0.6);
    circle(this.x, this.y, this.r);
}

move() {
    this.x = this.x + random(-3, 3);
    this.y = this.y + random(-3, 3);
}
}

class mousePixel {
constructor(x, y, r) {
    this.x = x;
    this.y = y;
    this.r = r;
}

display() {
    noStroke();
    fill(320, 100, 100, .6);
    circle(this.x, this.y, this.r);

}

move() {
    this.x = this.x + random(-3, 3);
    this.y = this.y + random(-3, 3);
}
}