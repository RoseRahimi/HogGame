
abstract class Block {
  //It has instance variables: "speed" to represent the block's speed,  
  float speed; 
  //"x" and "y" to represent the block's position,
  float x, y;
  //"r" to represent the block's radius (presumably), 
   float r;
  //and "HP" to represent the block's health points.
  int HP;
  //The class defines an abstract method called "display()" without an implementation. This method is meant to be overridden by subclasses, allowing each subclass to define its own way of displaying the block.
  abstract void display();



}
