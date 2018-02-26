//this is the the potato class
//the entity that is created from here will be the main attractor in the 2D world
//where the user will move their mouse around the canvas and thus controlling the space potato
//the potato wil float in space pulling random objects in its vicinity 
//once objects are pulled to the potato
//they will remain attached to the potato
//further feeding the potato's hungry power
//let's begin shall we!?!?!???!!?!??!!??!?!?!?!?!!??!?! -_-

class Potato {
  
  //image object for the sprite
  PImage mainPotato;
  //let's get some PVector up in this class!
  PVector location;      //gotta make an object for location so we can do some awesome physics!!!
  PVector  velocity;
  PVector acceleration;
  
  float mass;
  
  //gotta instantiate the potato objects pvector components
  Potato(float m, float x, float y) {
    mass = m;
    
    location = new PVector(x, y);
    
  // location = new PVector(mouseX, mouseY);    //we shall change this up later let us just try stuff out now
     velocity = new PVector(0, 0);
   
     acceleration = new PVector(0, 0);
     
     mainPotato = loadImage("potatoMain.png");


  }
  
  void applyForce(PVector force) {
    
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
    
    
  }
  
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    //clear acceleration else it will spin out of control so much speed much wow
    acceleration.mult(0);
    
    
  }
  
  //display the potato icon
  void display() {
    imageMode(CENTER);
    image(mainPotato, 0,0);
    mainPotato.resize(100,100);
  }
   
 
}