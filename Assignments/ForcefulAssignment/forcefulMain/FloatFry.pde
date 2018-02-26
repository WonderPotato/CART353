//this class is for the flying objects 
//they cannot be controlled by the user
//these flying chips will have their forces on the random
//meaning some will be big or small
//some will have varying masses




class FloatFry{
  
  
  PImage fries;
  PVector location;
  PVector velocity;
  
  
  
  FloatFry() {
    
    fries = loadImage("something.png");
    imageMode(CENTER);
    
    
    
  }
  
  
  
  
  
  
  
  
  
  void update(){
    
    
  }
  
  void display() {
    
    
  }
  
  
  
  
   void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
    //y check up
    
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height; 
    } else if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
    
    
  }
  
  
  
  
  
  
  
  
}