//this class is for the flying objects 
//they cannot be controlled by the user
//these flying chips will have their forces on the random
//meaning some will be big or small
//some will have varying masses
//references and guides
/*
* Forces (Gravity and Fluid Resistence) with Vectors 
 * by Daniel Shiffman.  
 * 
 * Demonstration of multiple force acting on bodies (Mover class)
 * Bodies experience gravity continuously
 * Bodies experience fluid resistance when in "water"
 
 also https://forum.processing.org/two/discussion/24548/how-to-make-balls-move-from-bottom-to-top-with-fluid-resistance-effect
 */



class FloatFry{
  
  
  
  
  
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  PImage friesSprite; 
  float mass;


  
    FloatFry(float m, PVector location_ , PImage fries) {
    
    mass = m;
   
    location = location_;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    //image variable for input 
    friesSprite = fries;
    
  }
  
  
  
    
  void attractor() {
    
    
  }
  
  
  
  void collider() {
    
    
  }
  
  //newtons cool stuff physics
  void applyForce(PVector force) {
   //divide the received force
   PVector f = PVector.div(force, mass);
   
   //accumulate all the forces in acceleration
   acceleration.add(f);
   //
    
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    //clear acceleration so nothing gets out of hand in space munchies
    acceleration.mult(0);
    
  }
  
  void display() {
    imageMode(CENTER);
    image(friesSprite, location.x, location.y, 120, 120);
    
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