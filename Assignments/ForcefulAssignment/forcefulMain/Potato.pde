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
  Potato(float m, float x, float y, PImage potatoSprite) {
    mass = m;
    
    location = new PVector(x, y);
    
  // location = new PVector(mouseX, mouseY);    //we shall change this up later let us just try stuff out now
     velocity = new PVector(0, 0);
   
     acceleration = new PVector(0, 0);
     
     mainPotato = potatoSprite;

  }

   
  void applyForce(PVector force) {
    
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
    
    
  }
  
 /* void drag(SpaceOil oily) {
    //get get that magnitude of veocity vector
    float speed = velocity.mag();
    //force magnitude
    float dragMagnitude = oily.c * speed * speed;
    
    //get variable of velocity as a copy!
    PVector drag = velocity.get();
    //inverse *-1 to change direction
    drag.mult(-1);
    //normalize the vector
    drag.normalize();
    
    //multiply magnitude and direction
    drag.mult(dragMagnitude);
    
    //apply the force luke
    applyForce(drag);
    
  }
  */
  
  //function to control main potato using up down arrow keys left right etc, mouse xy wont work with the drag forces.....
  
  void keyControls(){
   //let's move this potato!!!!!!! 
   if (key == CODED) {
     
     //MOVE WITH LEFT ARROW KEY
     if (keyCode == LEFT ) {
       location.x -=2;
       location.y += 0;
     }
     //MOVE WITH RIGHT ARROW KEY
     else if (keyCode == RIGHT) {
       location.x += 2;
       location.y += 0;
     } 
     //MOVE WITH UP ARROW KEY
    else if (keyCode == UP) {
      location.x += 0;
      location.y -= 2;
    }    
    //MOVE WITH DOWN ARROW KEY
    else if (keyCode == DOWN) {
      location.x += 0;
      location.y += 2;
    }    
   }
  }
  
  void attractor() {
    
    
  }
  
  
  
  void collider() {
    
    
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    //clear acceleration else it will spin out of control so much speed much wow
    acceleration.mult(0);
    
    
  }
  
  //display the potato sprite seperately from the mass and other force vectors
  void displaySprite() {
     imageMode(CENTER);
    image(mainPotato, location.x, location.y);
    mainPotato.resize(100,100);
    
    
    
  }
  
  
  
  
  //display the potato icon
/*void display() {
    noStroke();
    fill(0);
    //ellipse(location.x, location.y, mass*1, mass*1);
  }
  */ 
   //bounce off of the invisible force field in space
   void checkEdges() {
     
     if(location.x > width) {
       location.x = width;
       velocity.x *= -1;
     } else if (location.x < 0) {
       velocity.x *= -1;
       location.x = 0;
     }
    //check y boundaries  
     if(location.y > height) {
       velocity.y *= -1;
       location.y = height;
     } else if (location.y < 0) {
       velocity.y *= -1;
       location.y = 0;
     
     }
 
  }

}