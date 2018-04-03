class ParticleSystemB {
  ArrayList<ParticleB> particles;
  PVector origin;
PVector position; 

  ParticleSystemB(float x, float y) {
   position = new PVector(x, y);
    origin = position.copy();
    particles = new ArrayList<ParticleB>();
  }

  void addParticleB() {
    particles.add(new ParticleB(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      ParticleB p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}