class ParticleEm {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  ParticleEm(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    position = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    pushStyle();
    stroke(0,lifespan);
    strokeWeight(0);
    fill(255,lifespan);
    ellipse(position.x,position.y,50,50);
    popStyle();
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