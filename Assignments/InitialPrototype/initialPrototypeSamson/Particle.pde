//example code taken from Daniel Shiffman's book Nature of code
//chapter 4: particle system
// A simple Particle class

class Particle {
 // PVector position;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  float mass = 1;

 /* Particle(float x, float y) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = new PVector(x,y);
    lifespan = 255.0;
  }
*/
Particle(PVector l) {
   acceleration = new PVector(0,0);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0;
  
}

  void run() {
    update();
    display();
  }


void applyForce(PVector force) {
  PVector f = force.get();
  f.div(mass);
  acceleration.add(f);
}

  // Method to update position
 /* void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }
*/

//method to update stuff 
void update() {
 velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0; 
  
  
  
}
/*  // Method to display
  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }*/
  
  //display with location
  void display() {
    stroke(100,lifespan,255);
    
    fill(255,lifespan);
    ellipse(location.x,location.y,25,25);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}