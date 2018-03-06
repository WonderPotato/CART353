//example code taken from Daniel Shiffman's book Nature of code
//chapter 4: particle system

class Repeller {
 
//How strong is the repeller?
  float strength = 50;
  PVector location;
  float r = 10;
 
  Repeller(float x, float y)  {
    location = new PVector(x,y);
  }
 
  void display() {
    stroke(255);
    fill(255,0,0);
    ellipse(location.x,location.y,r*2,r*2);
  }
 
  PVector repel(Particle p) {
//This is the same repel algorithm we used in Chapter 2: forces based on gravitational attraction.
    PVector dir = PVector.sub(location,p.location);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d,5,100);
    float force = -1 * strength / (d * d);
    dir.mult(force);
    return dir;

  }
}