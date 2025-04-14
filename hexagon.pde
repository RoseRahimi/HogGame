class Hexagon6 extends Block {
  //The class defines a constant variable "WIDTH" with a value of 30, representing the width of the hexagon.
  final int WIDTH = 30;
  //It also declares a variable "fillColor" of type "color" and initializes it with an RGB value (46, 204, 113), representing the fill color of the hexagon.
  color fillColor = color(46, 204, 113);
//The class has a constructor that takes the initial position (x, y) and health points (HP) of the hexagon as parameters. It initializes the instance variables accordingly.
  Hexagon6(float x, float y, int HP) {
    this.x = x;
    this.y = y;
    this.r = random(TWO_PI);
    this.HP = HP;
   
  }
  //The class overrides the "display()" method defined in the abstract "Block" class.
  void display() {
    //Inside the "display()" method, it sets the fill color, stroke color, and stroke weight for drawing the hexagon.
    fill(fillColor);
    stroke(93);
    strokeWeight(2);
    pushMatrix();
    //It uses translation and rotation transformations to position and rotate the hexagon around its center point.
    translate(x, y);
    rotate(r);
    beginShape();
    //It uses translation and rotation transformations to position and rotate the hexagon around its center point.
    for (int i = 0; i < 6; i++) {
      vertex(WIDTH*cos(TWO_PI/6*i), WIDTH*sin(TWO_PI/6*i));
    }
    //"endShape(CLOSE)" to connect the vertices and complete the shape of the hexagon.
    endShape(CLOSE);

    popMatrix();
  }

}
