class ParticleEmission{
  
  ArrayList<ParticleEmit> particles;
  PVector origin;
  int particleSpawnRate = 10;

  ParticleEmission(PVector position) {
    origin = position.get();
    particles = new ArrayList<ParticleEmit>();
  }

  void addParticle(float x, float y) {
    origin = new PVector(x,y);
    particleSpawnRate++;
    //float r = random(1);
    if ((0 % particleSpawnRate) == 0) { 
      particles.add(new ParticleEmit(origin));
    } 
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      ParticleEmit p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}