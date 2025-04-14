class Triangle3 extends Block {
//a constant variable "WIDTH" to represent the width of the triangle shape and "fillColor" to represent the color of the triangle.
  final int WIDTH = 30;
  color fillColor = color(252, 118, 119);
//constructor that takes parameters "x", "y", and "HP" to set the initial position and health points of the triangle. It also initializes the inherited variables and sets the speed of the triangle randomly between -1 and 1. If the saved time from the timer is greater than or equal to 15, the speed is set randomly between -1 and 2.
  Triangle3(float x, float y, int HP) {
    this.x = x;
    this.y = y;
    this.r = random(TWO_PI);
    this.HP = HP;
    speed = random(-1, 1);
    if (timer.savedTime /1000 >=15){
      speed = random(-1,2);
    }
  }
//that draws the triangle on the screen. It sets the fill color, stroke color, and stroke weight. It then updates the position of the triangle based on its speed. If the triangle goes outside the screen vertically (either above or below), it reverses its direction by multiplying the speed by -1. Finally, it translates the coordinate system to the triangle's position, rotates it based on its angle, and draws a triangle shape using the "triangle" function.
  void display() {
    fill(fillColor);
    stroke(93);
    strokeWeight(2);
    y +=speed;
     // Check if triangle is outside the screen boundaries
    if (y < -WIDTH || y > height + WIDTH) {
      // Reverse the direction when it goes outside
      speed *= -1;
    }
    pushMatrix();

    translate(x, y);
    rotate(r);
    triangle(WIDTH+cos(0), WIDTH*sin(0), WIDTH*cos(TWO_PI/3), WIDTH*sin(TWO_PI/3), WIDTH*cos(TWO_PI/3*2), WIDTH*sin(TWO_PI/3*2));

    popMatrix();
  }
 
    
}
