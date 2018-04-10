class ParticleEmission{
  ArrayList<ParticleEm> particles;
  PVector origin;
  int particleSpawnRate = 0;

  ParticleEmission(float x, float y) {
    origin = new PVector(x, y);
    particles = new ArrayList<ParticleEm>();
  }

  void addParticle() {
    particleSpawnRate++;
    //float r = random(1);
    if ((particleSpawnRate % 20) == 0) { 
      particles.add(new ParticleEm(origin));
    } 
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      ParticleEm p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}