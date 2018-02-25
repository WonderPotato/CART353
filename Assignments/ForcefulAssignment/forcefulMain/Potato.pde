//this is the the potato class
//the entity that is created from here will be the main attractor in the 2D world
//where the user will move their mouse around the canvas and thus controlling the space potato
//the potato wil float in space pulling random objects in its vicinity 
//once objects are pulled to the potato
//they will remain attached to the potato
//further feeding the potato's hungry power
//let's begin shall we!?!?!???!!?!??!!??!?!?!?!?!!??!?! -_-

class Potato {
  
  
  //let's get some PVector up in this class!
  
  
  PVector location;      //gotta make an object for location so we can do some awesome physics!!!
  PVector  velocity;
  PVector acceleration;
  //others??
  
  
  //gotta instantiate the potato objects pvector components
  Potato() {
    
   location = new PVector(random(width), random(height));    //we shall change this up later let us just try stuff out now
   
   velocity = new PVector(0,0);
   
   //acceleration?? it's not an object?
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}