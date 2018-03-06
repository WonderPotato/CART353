//example code taken from Daniel Shiffman's book Nature of code
//chapter 4: particle system
// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

void applyForce(PVector f) {
 for (Particle p: particles) {
   p.applyForce(f);
 } 
}
  
  void applyRepeller(Repeller r) {
    for (Particle p: particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }
  
  
  
  
  void run() {

    
    
    
    
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

}