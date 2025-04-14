class Rectangle4 extends Block {
//variable "WIDTH" to represent the width of the rectangle shape and "fillColor" to represent the color of the rectangle.
  final int WIDTH = 30;
  color fillColor = color(255, 232, 105);
//constructor that takes parameters "x", "y", and "HP" to set the initial position and health points of the rectangle. It also initializes the inherited variables and sets the speed of the rectangle randomly between -1 and 1. If the saved time from the timer is greater than or equal to 30, the speed is set randomly between -1 and 2.
  Rectangle4(float x, float y, int HP) {
    this.x = x;
    this.y = y;
    this.r = random(TWO_PI);
    this.HP = HP;
    speed = random(-1, 1);
     if (timer.savedTime /1000 >=30){
      speed = random(-1,2);
    }
  }
//draws the rectangle on the screen. It sets the fill color, stroke color, and stroke weight. It then updates the position of the rectangle based on its speed. If the rectangle goes outside the screen vertically (either above or below), it reverses its direction by multiplying the speed by -1. Finally, it translates the coordinate system to the rectangle's position, rotates it based on its angle, and draws a rectangle shape using the "rect" function.
  void display() {

    fill(fillColor);
    stroke(93);
    strokeWeight(2);
    y +=speed;
     if (y < -WIDTH || y > height + WIDTH) {
      // Reverse the direction when it goes outside
      speed *= -1;
    }
    pushMatrix();

    translate(x, y);
    rotate(r);
    rect(0, 0, WIDTH, WIDTH, 1);

    popMatrix();
  }
}
