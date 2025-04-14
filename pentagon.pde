class Pentagon5 extends Block {
  //The class defines a constant variable "WIDTH" with a value of 30, representing the width of the pentagon.
  final int WIDTH = 30;
  //It also declares a variable "fillColor" of type "color" and initializes it with an RGB value (118, 141, 252), representing the fill color of the pentagon.
  color fillColor = color(118, 141, 252);
//constructor that takes the initial position (x, y) and health points (HP) of the pentagon as parameters. It initializes the instance variables accordingly.
  Pentagon5(float x, float y, int HP) {
    this.x = x;
    this.y = y;
    this.r = random(TWO_PI);
    this.HP = HP;
   
  }
//the "display()" method defined in the abstract "Block" class. it sets the fill color, stroke color, and stroke weight for drawing the pentagon.
  void display() {
    fill(fillColor);
    stroke(93);
    strokeWeight(2);
    pushMatrix();
    //translation and rotation transformations to position and rotate the pentagon around its center point.
    translate(x, y);
    rotate(r);
    beginShape();
    //uses a loop to create the vertices of the pentagon by calculating their positions based on the current angle.
    for (int i = 0; i < 5; i++) {
      vertex(WIDTH*cos(TWO_PI/5*i), WIDTH*sin(TWO_PI/5*i));
    }
    //"endShape(CLOSE)" to connect the vertices and complete the shape of the pentagon.
    endShape(CLOSE);

    popMatrix();
  }
 
}
