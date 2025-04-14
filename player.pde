class Catcher {
  //"w" to represent the radius of the catcher, "col" to represent the color of the catcher, and "x" and "y" to represent the location of the catcher.
  float w;    // radius
  color col;  // color
  float x, y; // location
  //a variable "bucket" of type "PImage" to store an image of the catcher.
  PImage bucket;

//a constructor that takes a parameter "tempR" to set the radius of the catcher. It initializes the instance variables accordingly and loads an image of the catcher from a file called "hog.png" and resizes it.
  Catcher(float tempR) {
    
    w = tempR;
    col = color(50, 10, 10, 150);
    x = 0;
    y = 0;
    bucket = loadImage("hog.png");
    bucket.resize(64 , 64);
    
  }
//takes parameters "tempX" and "tempY" to set the location of the catcher.
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
//"display" that draws the catcher on the screen using the fill color, stroke color, and image.
  void display() {
    stroke(0);
    fill(col);
    image(bucket, x, y);
   
  }
  //The class defines a method called "intersects" that takes a parameter of type "Block" and checks if the catcher intersects with the given block. It calculates the distance between the catcher and the block's position and compares it to the sum of their radii to determine if they intersect.
 boolean intersects(Block block) {
    float distance = dist(x, y, block.x, block.y);
    //The "intersects" method returns a boolean value indicating whether the catcher intersects with the block or not.
    if (distance < w + block.r) {
      return true;
    } else {
      return false;
    }
  }
}
