/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/
 KinectPV2, Kinect for Windows v2 library for processing
 Skeleton color map example.
 Skeleton (x,y) positions are mapped to match the color Frame
 */

import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;

KinectSkeleton skeleton;
//ParticleEmission pEmit;

ParticleSystemB ps;

ParticleEmission pEmit;

//ParticleEm[] pEmits = new ParticleEm[1000];

// A bunch of planets
Planet[] planets = new Planet[20];
// One sun (note sun is not attracted to planets (violation of Newton's 3rd Law)
Sun s;
// An angle to rotate around the scene
float angle = 0;

Sun s2;
ArrayList<Firework> fireworks;

PVector gravity = new PVector(0, 0.2);



void setup() {

  //size(1920, 1080, P3D);
  fullScreen(P3D);

  kinect = new KinectPV2(this);

  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);
 kinect.enableDepthImg(true);
  kinect.enableDepthMaskImg(true);
  kinect.enableInfraredImg(true); 
  kinect.enableSkeletonDepthMap(true);

// Enable 3d  with (x,y,z) position
  kinect.enableSkeleton3DMap(true);

  kinect.init();
   
   
     skeleton = new KinectSkeleton();


   fireworks = new ArrayList<Firework>();
  
  
     for (int i = 0; i < planets.length; i++) {
    planets[i] = new Planet(random(0.1, 12), random(-width/2, width/2), random(-height/2, height/2), random(-100, 100));
  }
  // A single sun
  //s = new Sun();
   pEmit = new ParticleEmission(skeleton.headX , skeleton.headY );
 
    //  s = new Sun(new PVector(leftElbowX), ));


//initialize objects of anything with skeleton joint data here
//use skeleton.jointnameX, skeleton.jointnameY





      s = new Sun(skeleton.leftElbowX, skeleton.leftElbowY);


//particle system

//sun on the shoulders
s2 = new Sun(skeleton.leftShoulderX, skeleton.leftShoulderY);
//lines cut across

//sound burst
//play video in background\

 
 }

void draw() {
  background(0);


  skeleton.displaySkeleton();


  pEmit.addParticle();
  pEmit.run();
// If you want to see the RGB image from HD Camera
  //image(kinect.getColorImage(), 0, 0, width, height);


       
   s.display(); 
    s2.display();

 
       sphereDetail(8);
  lights();
  translate(width/2, height/2);
  rotateY(angle);
 
  // Display the Sun


  
  // All the Planets
  for (Planet planet : planets) {
    // Sun attracts Planets
    PVector force = s.attract(planet);
    PVector force2 = s2.attract(planet);
    
    planet.applyForce(force2);
    
    planet.applyForce(force);
    // Update and draw Planets
    planet.update();
    planet.display();
  }

  // Rotate around the scene
  angle += 0.003;
        
 
  
     //} else   {
  if (skeleton.rightElbowX > width /2 && skeleton.rightElbowY > width/2) {
if (random(1) < 0.2) {
    fireworks.add(new Firework());
  }

 translate(width/2, height, -1000);
  rotateY(frameCount*0.003);



  for (int p = fireworks.size()-1; p >= 0; p--) {
    Firework f = fireworks.get(p);
    f.run();
    if (f.done()) {
      fireworks.remove(p);
    }
  }
    // }
       
  
       
     
  
     }
   
   


  
       
       pEmit.addParticle();
  pEmit.run();
println("particle emission:: " + pEmit);
     
  fill(255, 0, 0);
  textSize(10);
  text(frameRate, 50, 50);
}

// * Print informations text functions

// Print the X & Y positions next of a particular joint
    void printXY(KJoint[] joints, int jointType) { 
      float xpos = joints[jointType].getX();
      float ypos = joints[jointType].getY();
      textSize(3);
      fill(0, 255, 0);
      text("X = " + xpos, xpos+50, ypos);
      text("Y = " + ypos, xpos+50, ypos+50);
      
    } 

// Print the X & Y positions of all the skeleton, next to each joint
    void printSkeleton(KJoint[] joints) { 
      for(int i = 0; i <= 25; i++) {
        printXY(joints, i);
      }
    }

  float[] getSkeletonZ(KJoint[] joints3D) {
    int joints_number = 25;
    float[] z_values = new float[joints_number];
// For every joints, get the z value, store it in an array 
     for(int i = 0; i < joints_number; i++) {
        z_values[i] = joints3D[i].getZ();
      }
      return z_values;
  }
  
  
  