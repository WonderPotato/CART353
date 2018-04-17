/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/
 KinectPV2, Kinect for Windows v2 library for processing
 Skeleton color map example.
 Skeleton (x,y) positions are mapped to match the color Frame
 */
import processing.sound.*;
import KinectPV2.KJoint;
import KinectPV2.*;
import processing.video.*;
import gifAnimation.*;

KinectPV2 kinect;

KinectSkeleton skeleton;

ParticleEmission pEmit2;
ParticleEmission pEmit3;
ParticleEmission pEmit6;
ParticleEmission pEmit7;

//gifs to display

Gif reyRage;
Gif slowLight;
Gif impactLight;
Gif midFight;
Gif rage;
Gif girlPlease;
Gif bb8;
Gif hanSowat;

PImage saberLight;

//sound files to initialize

//tieexplode
SoundFile explodeHead;
//lightsaberclash
SoundFile lightClash;
//lightsaberon
SoundFile lightOn;
//SWtheme
SoundFile swTheme;
//tiefire
SoundFile tieFire;
//weeoow
SoundFile weeOow;
//xwingexplode
SoundFile xExplode;
//imperialmarch
SoundFile imperialM;


// A bunch of planets
Planet[] planets = new Planet[20];


Planet[] planets2 = new Planet[5];
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

for(int b = 0; b < planets2.length; b++) {
  planets2[b] = new Planet(random(0.1, 5), random(-width/4, width/4), random(-height/4, height/4), random(-50,50));
  
}

//emission initialize
  pEmit2 = new ParticleEmission(new PVector(skeleton.leftHandX,skeleton.leftHandY));
  pEmit3 = new ParticleEmission(new PVector(skeleton.rightHandX,skeleton.rightHandY));
  pEmit6 = new ParticleEmission(new PVector(skeleton.leftShoulderX,skeleton.leftShoulderY));
  pEmit7 = new ParticleEmission(new PVector(skeleton.rightShoulderX, skeleton.rightShoulderY));
  
  
  //tieexplode
   explodeHead = new SoundFile(this, "TIEexplode.mp3");
//lightsaberclash
 lightClash = new SoundFile(this, "LightsaberClash.mp3");
//lightsaberon
 lightOn = new SoundFile(this, "lightSaberOn.mp3");
//SWtheme
 swTheme = new SoundFile(this, "SWTheme.mp3");
//tiefire
 tieFire = new SoundFile(this, "TIEfire.mp3");
//weeoow
 weeOow = new SoundFile(this, "WEEOOW.mp3");
//xwingexplode
 xExplode = new SoundFile(this, "XWingexplode.mp3");
//imperialmarch
 imperialM = new SoundFile(this, "imperialMarch.mp3");

  
  
  



//sun on the shoulders
//lines cut across

//sound burst
//play video in background\

 
 }

void draw() {
  background(0);
  fill(255);
  textSize(20);
text("Ignite your world here!", width/1.9, height/6);

  skeleton.displaySkeleton();
 s = new Sun(skeleton.leftShoulderX, skeleton.leftShoulderY);
s2 = new Sun(skeleton.rightShoulderX, skeleton.rightShoulderY);

// If you want to see the RGB image from HD Camera
 // image(kinect.getColorImage(), 0, 0, width, height);
 // strokeWeight(100);
 stroke(255,05,155);
ellipse(skeleton.headX, skeleton.headY, 85,85);
       
 //      strokeWeight(5);
   s.display(); 
    s2.display();

 pushMatrix();
       sphereDetail(8);
  lights();
  translate(width/2, height/2);
  rotateY(angle);
 
  // Display the Sun


  
  // All the Planets
  for (Planet planet : planets) {
    // Sun attracts Planets
    PVector force = s.attract(planet);
    
    
    planet.applyForce(force);
    // Update and draw Planets
    planet.update();
    planet.display();
  }

  // Rotate around the scene
  angle += 0.003;
        
 popMatrix();
  
  
  pushMatrix();
  
  // All the Planets
  for (Planet planet : planets2) {
    // Sun attracts Planets
    PVector force2 = s2.attract(planet);
    
    planet.applyForce(force2);
    
    // Update and draw Planets
    planet.update();
    planet.display();
  }

  // Rotate around the scene
  angle += 0.01;
        
 popMatrix();
  
  
  
  
  
  
 
  
  
  
  
  
  
  
  pushMatrix();
     //} else   {
  if (skeleton.headX > width/2) {
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
       
  }
  popMatrix();
  
  
  
  
     //particle emitter update functions

  pEmit2.addParticle(skeleton.leftHandX,skeleton.leftHandY);
  pEmit2.run();
  pEmit3.addParticle(skeleton.rightHandX,skeleton.rightHandY);
  pEmit3.run();

  pEmit6.addParticle(skeleton.leftShoulderX,skeleton.leftShoulderY);
  pEmit6.run();
  pEmit7.addParticle(skeleton.rightShoulderX, skeleton.rightShoulderY);
  pEmit7.run();
  saberLight = loadImage("lightBlade2.png");
  image(saberLight, skeleton.leftHandX, skeleton.leftHandY);
  
  
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
  
  
  