/*

Michelle Samson
27037600
CART 353 - WINTER 2018
PROFESSOR RILLA KHALED
FINAL PROTOTYPE
A 3D IN SPACE EXPLORATION OF THE SELF 

*/
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
Gif obino;
Gif renep8;
Gif reyep7;
Gif poeep7;
Gif swep4;
Gif pdep7;
Gif ep7st;
Gif ep6;
Gif reyren;

   
PImage saberLight;
PImage saberDark;
//sound files to initialize


//lightsaberclash
SoundFile lightClash;
//lightsaberon
SoundFile lightOn;
//SWtheme
SoundFile swTheme;
//tiefire
SoundFile tieFire;
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
  
    saberLight = loadImage("lightsaber2.png");
    saberDark = loadImage("lightred2.png");
    
//lightsaberclash
 lightClash = new SoundFile(this, "LightsaberClash.mp3");
//lightsaberon
 lightOn = new SoundFile(this, "lightSaberOn.mp3");
//SWtheme
 swTheme = new SoundFile(this, "SWTheme.mp3");
//tiefire
 tieFire = new SoundFile(this, "TIEfire.mp3");

//xwingexplode
 xExplode = new SoundFile(this, "XWingexplode.mp3");
//imperialmarch

  
  
  //play gif animation
   reyRage = new Gif(this, "reyrageep7.gif");
   reyRage.loop(); 
   
   slowLight = new Gif(this, "slowLight.gif");
   slowLight.loop();
   
   impactLight = new Gif(this, "impactLight.gif");
   impactLight.loop();
   
   midFight = new Gif(this, "midFight.gif");
   midFight.loop();
   
   rage = new Gif(this, "rage.gif");
   rage.loop();
   
   girlPlease = new Gif(this, "girlPlease.gif");
   girlPlease.loop();
   
   bb8 = new Gif(this, "bb8.gif");
   bb8.loop();
   
   hanSowat = new Gif(this, "hanSowat.gif");
   hanSowat.loop();
   
   obino = new Gif(this, "obino.gif");
   obino.loop();
   
   renep8 = new Gif(this, "renep8.gif");
   renep8.loop();
   
   reyep7 = new Gif(this, "reyep7.gif");
   reyep7.loop();
   
   poeep7 = new Gif(this, "poeep7.gif");
   poeep7.loop();
   
   swep4 = new Gif(this, "swep4.gif");
   swep4.loop();
   
   pdep7 = new Gif(this, "pdep7.gif");
   pdep7.loop();
   
   ep7st = new Gif(this, "ep7st.gif");
   ep7st.loop();
   
   ep6 = new Gif(this, "ep6.gif");
   ep6.loop();
   
   reyren = new Gif(this, "reyren.gif");
   reyren.loop();
   


  swTheme.play();
  swTheme.loop();
  swTheme.amp(0.8);
 
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
  
  
  
  
  
  
 
  
  

   textSize(25);
   text("aim your arms downwards!", 100, 100);
   if(skeleton.wristLeftX >= width/2 && skeleton.wristLeftY >= height/2 && skeleton.wristRightX >= width/2 && skeleton.wristRightY >= height/2) {
     
   
   
 
   image(impactLight ,width/2, height/2);
   
  

   
   image(bb8,width/8,width/6);
 
  
    image(obino, width/4,width/6);
    
     image(renep8,width/5,width/4);
       
   }
      
  
  
  
  
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

pushMatrix();
translate(skeleton.wristRightX-10, skeleton.wristRightY-150);
  image(saberLight,0,0);
  popMatrix();
  
  pushMatrix();
  translate(skeleton.wristLeftX-200, skeleton.wristLeftY - 160);
  image(saberDark, 0,0);  
  popMatrix();
  
  textSize(20);
  text("swing your lightsaber downwards!", width/1.5, height/2);
  if(skeleton.wristRightY > height/1.5){
  lightClash.loop(); 
    lightClash.amp(0.1);
     image(ep6, 100, 10);
      image(reyRage,100, 220);
     image(reyep7, 100, 410);
  image(rage,100, 610);
  image(midFight,100,810);
  } else { 
    lightClash.stop(); 
}
  
 
 
 fill(255);
 textSize(20);

 text("Place your left hand here..", width/6, height/4);
 text("Place your right hand here...",width/1.3, height/4);
 if(skeleton.wristLeftX >= width/6 && skeleton.wristLeftY <= height/4 && skeleton.wristRightX <= width/1.3 && skeleton.wristRightY <= height/4) {
   image(hanSowat, 0, 0, width, height);
   
 }
 
 
     
 /*
   
   
     image(slowLight,width/4,width/4);
     
     
      image(poeep7, 2,2);
      
      image(swep4, 2,2);
     
     image(pdep7, 2,2);
  
  image(ep7st, 2,2);
  
  
  
  image(reyren, 2,2);
   
   
   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  */
  
  
  
  
  
  
  
  
  
  
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
  
  
  