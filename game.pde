//Imports the necessary sound and graphics libraries.
import processing.sound.*;
//Declares variables for sound files, objects (such as the Catcher and Timer), an ArrayList for blocks, and other variables for game elements.
SoundFile caughtGood;
SoundFile Gameover;
SoundFile Levelup;
SoundFile winner;
Catcher catcher; 
Timer timer;
ArrayList<Block> allBCK = new ArrayList<Block>();
int MAX_BLK = 0;    
PImage bg;  
int score = 0;
PImage loser;
PImage win;
boolean GameStatus = true;
int totalTime = 60;
boolean menu = true;

//Defines the setup() function, which initializes the game by setting up the canvas, loading sound files, resizing images, and creating objects.
void setup() {
  size(800, 600);
  caughtGood = new SoundFile(this, "CaughtGood.wav");
  Gameover = new SoundFile(this, "Gameover.mp3");
  Levelup = new SoundFile(this, "chime.wav");
  winner = new SoundFile(this, "win.wav");
  catcher = new Catcher(30); 
  timer = new Timer(300);
  loser = loadImage("loser.jpeg");
  loser.resize (width, height);
  bg = loadImage("bg.jpeg");
  bg.resize(width, height);
  win = loadImage("win.jpeg");
  win.resize(width, height);
   
 
}
//Defines the draw() function, which handles the main game logic and rendering.

void draw( ) {
  //Checks if the game is in the menu state or the gameplay state.
  if (menu){
    //In the menu state, displays the game title, rules, and instructions to start the game.
    menu();
    
  } else {
    //In the gameplay state:
//Checks if the game is over (collision with specific block types) or if the player has won (reached a certain score within the time limit).

  if (GameStatus == true){
    //Renders the background, adds blocks, and updates the score and timer.
    drawBG();
    drawAllBlk();
    addBLK();
    drawScore();
    drawTimer();
    timer.start();
   
    
//Iterates over all blocks and displays them.
 for (int i = allBCK.size() - 1; i >= 0; i--) {
  Block b = allBCK.get(i);
  b.display();
  //Checks for collisions between the Catcher and blocks.
  if (catcher.intersects (b)) {
    
    if (b instanceof Hexagon6 || b instanceof Pentagon5) {
      caughtGood.play();
      allBCK.remove(i);
      score++;
     
    } else if (b instanceof Triangle3 || b instanceof Rectangle4) {
        
        allBCK.remove(i);
        image(loser, 0, 0);
        Gameover.play();
        score = 0;
        GameStatus = false; 
    }
    
  }
    //Updates the Catcher's position based on the mouse's location.
     catcher.setLocation(mouseX, mouseY); 
     //display the catcher
     catcher.display(); 
    
}
 
 
}
 if (timer.savedTime/1000 <= 40 && score >= 15){
   image(win,0,0);
   winner.play();
   GameStatus = false;
 } else if (timer.savedTime/1000 >=40 && score < 15){
   image(loser,0,0);
   GameStatus = false;
  } 
}
}
//Defines the drawTimer() function to display the remaining time.
void drawTimer(){
     textSize(30);
     fill(0);
     text("Timer:", 50, 50);
     text(timer.savedTime/1000,100,50);
}
//Defines the keyPressed() function to start the game when the Enter key is pressed on the menu screen.
void keyPressed(){
  if (menu){
    if (keyCode == ENTER || keyCode == RETURN) {
      // Start the game from the main menu
      menu = false;
      
    }
  }}
//Defines the menu() function to render the menu screen.
void menu(){
  background(160);
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text("The Hog Game", width / 2, height / 2 - 100);
  textSize(15);
  text("Game Rules: \n Hog's safe space is the left side of screen\n  Place your mouse on the left corner of screen before you start the game. \n By catching each Pentagon and Hexagon your score increases by 1. \n If the hog be touched by triangle or rectangle, the game will be over. \n To win the game collect 10 shapes.\n you will hear the sound of Chime when more blocks are added", width / 2, height / 2 - 50);
  textSize(40);
  fill(random(0), random(0), random(255));
  text("Press ENTER to start", width / 2, height / 2 + 180);
 
}
//Defines the drawBG() function to render the background and apply effects based on the timer.
void drawBG() {
  image(bg,0,0);
  if (timer.savedTime/1000 >= 15){
     bg.loadPixels();
  for (int x = 0; x < width; x = x + 1) {
    for (int y = 0; y < height; y = y + 1) {
      int idx = y * bg.width + x;
      color px = bg.pixels[idx];
      float r = red(px);
      float g = green(px);
      float b = blue(px);
     px = swap(px);
      bg.pixels[idx] = px;
    }
  }
  bg.updatePixels();
  image(bg, 0, 0);
}
if (timer.savedTime/1000 >= 30){
     bg.loadPixels();
  for (int x = 0; x < width; x = x + 1) {
    for (int y = 0; y < height; y = y + 1) {
      int idx = y * bg.width + x;
      color px = bg.pixels[idx];
      float r = red(px);
      float g = green(px);
      float b = blue(px);
    float sum = r + g + b;
          if (sum < 182) {
            px = color(0, 51, 76);
          } else if (sum < 364) {
            px = color(217, 26, 33);
          } else if (sum < 546) {
            px = color(112, 150, 158);
          } else {
            px = color(252, 227, 166);
          }
      bg.pixels[idx] = px;
    }
  }
  bg.updatePixels();
  image(bg, 0, 0);
}
}
//Defines the swap() function to swap color channels in an image.
color swap(color px) {
  float r = red(px);
  float g = green(px);
  float b = blue(px);
  return color(b, r, g);
}
//Defines the drawAllBlk() function to display all blocks.
void drawAllBlk() {
  for (int i = 0; i < allBCK.size(); i++) {
    allBCK.get(i).display();
  }
}
//Defines the drawScore() function to display the player's score.
void drawScore(){
 
  textSize(30);
  text("Score:", 50, 110);
  text(score,100,110);
  
}

//Defines the addBLK() function to add blocks to the game based on conditions and play a sound when additional blocks are added.
void addBLK() {
  float x, y;
  int RecHP = 40;
  int TriHP = 20;
  int PenHP = 60;
  int HexHP = 80;
  
  if (allBCK.size() < 30) {
    x = random(width);
    y = random(height);
    int shapeIndex = int(random(4));
    
    switch(shapeIndex) {
       case 0: 
        allBCK.add(new Pentagon5((x+140), y, PenHP));
        break;
      case 1: 
        allBCK.add(new Hexagon6((x+140), y, HexHP));
        break;
      case 2: 
        allBCK.add(new Rectangle4((x+140), y, RecHP));
        break;
      case 3: 
        allBCK.add(new Triangle3((x+140), y, TriHP));
        break;
     
    }
  } 
 
  if (timer.savedTime/1000 >= 15){
   
   if (allBCK.size() < 40) {
    x = random(width);
    y = random(height);
    int shapeIndex = int(random(4));
     Levelup.play();
    switch(shapeIndex) {
       case 0: 
        allBCK.add(new Pentagon5((x+140), y, PenHP));
        break;
      case 1: 
        allBCK.add(new Hexagon6((x+140), y, HexHP));
        break;
      case 2: 
        allBCK.add(new Rectangle4((x+140), y, RecHP));
        break;
      case 3: 
        allBCK.add(new Triangle3((x+140), y, TriHP));
        break;
     
    }
    
}
}

 if (timer.savedTime/1000 >= 30){
   
   if (allBCK.size() < 60) {
    x = random(width);
    y = random(height);
    int shapeIndex = int(random(4));
     Levelup.play();
    switch(shapeIndex) {
       case 0: 
        allBCK.add(new Pentagon5((x+140), y, PenHP));
        break;
      case 1: 
        allBCK.add(new Hexagon6((x+140), y, HexHP));
        break;
      case 2: 
        allBCK.add(new Rectangle4((x+140), y, RecHP));
        break;
      case 3: 
        allBCK.add(new Triangle3((x+140), y, TriHP));
        break;
     
    }
    
}
}
}
