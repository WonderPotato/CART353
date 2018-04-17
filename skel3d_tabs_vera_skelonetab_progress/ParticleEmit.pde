class ParticleEmit {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  //color of the particle
  float r1;
  float g1;
  float b1;
  
  //multiply saturation value with each rgb channel to get different saturation
  float saturation = random(1,2);
  
  //size of particles
  float size = random(3,20);
  
  color particleColor = color(r1,g1,b1);

  ParticleEmit(PVector l) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(random(-1,1),random(-2,2));
    position = l.get();
    lifespan = 400.5;
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
    fill(205, 32,lifespan);
    //fill(particleColor);
    ellipse(position.x,position.y,size,size);
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