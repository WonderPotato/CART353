/*
  Initial Prototype 
 
 Michelle Samson
 27037600
 
 CART 353 - winter 2018
 
 due date march 6, 2018
 
 Professor Rilla Khaled
 
 Project SHIFT + SPACE: an Action Reaction Experience for the individual
 
 */

/*

 This code takes examples and resources from the following:
 
 Processing's Nature of Code: Ch4: particle system: repeller/particle/particlesystem example code from Shiffman
 
 Processing library FingerTracker by Greg Borenstein. (C) 2012
 
 OpenKinect: freenect V1 - shiffman modification of libfreenect library
 
 */


/*
this program allows the user to face the kinect v1 
 and to repel falling particles 
 by positioning their hands within 2-3 feet
 from the kinect sensor.
 
 this program is meant to show the interaction between the individual 
 and their surroundings
 
 
 */



//import libraries
import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

// import the fingertracker library
// and the SimpleOpenNI library for Kinect access
import fingertracker.*;
//import SimpleOpenNI.*;  took out simpleopenni because it doesn't work with processing 3

//therefore need to adjust the various functions initialized within the setup and others in draw
//such as kinect.update is not a function in freenect

  //declare objects from the various classes
// declare FignerTracker and SimpleOpenNI objects
FingerTracker fingers;
//SimpleOpenNI kinect;
Kinect kinect;

ParticleSystem ps;

Repeller[] repellers;


// set a default threshold distance:
// 625 corresponds to about 2-3 feet from the Kinect
int threshold = 625;



void setup() {
  size(640, 480);

  // initialize your SimpleOpenNI object
  // and set it up to access the depth image
  kinect = new Kinect(this);
  kinect.initDepth();
  // mirror the depth image so that it is more natural
  kinect.enableMirror(true);
  repellers = new Repeller[10];

  for (int i = 0; i < repellers.length; i++) {
    repellers[i] = new Repeller(width/2 -20, height/2);
  }
  // initialize the FingerTracker object
  // with the height and width of the Kinect
  // depth image
  fingers = new FingerTracker(this, 640, 480);
  // the "melt factor" smooths out the contour
  // making the finger tracking more robust
  // especially at short distances
  // farther away you may want a lower number
  fingers.setMeltFactor(100);

  ps = new ParticleSystem(new PVector(width/2, 50));
}

void draw() {
  background(0);
  // get new depth data from the kinect
  // kinect.display();
  // get a depth image and display it
  PImage depthImage = kinect.getDepthImage();
  image(depthImage, 0, 0);

  // update the depth threshold beyond which
  // we'll look for fingers
  fingers.setThreshold(threshold);

  // access the "depth map" from the Kinect
  // this is an array of ints with the full-resolution
  // depth data (i.e. 500-2047 instead of 0-255)
  // pass that data to our FingerTracker
  int[] getDepthMap = kinect.getRawDepth();
  fingers.update(getDepthMap);

  // iterate over all the contours found
  // and display each of them with a green line
  stroke(0, 255, 0);
  for (int k = 0; k < fingers.getNumContours(); k++) {
    fingers.drawContour(k);
  }

  // iterate over all the fingers found
  // and draw them as a red circle
  noStroke();
  fill(255, 0, 0);
  for (int i = 0; i < fingers.getNumFingers(); i++) {
    PVector position = fingers.getFinger(i);
    if (i < 10) {
      // ellipse(position.x - 5, position.y -5, 10, 10);
      repellers[i].location = new PVector(position.x -5, position.y -5);
    }
  }

  // show the threshold on the screen
  fill(255, 0, 0);
  text(threshold, 10, 20);

  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);
  ps.addParticle();
  for ( int i = 0; i < repellers.length; i++) {


    ps.applyRepeller(repellers[i]);
    repellers[i].display();
  }
  ps.run();
}

// keyPressed event:
// pressing the '-' key lowers the threshold by 10
// pressing the '+/=' key increases it by 10 
void keyPressed() {
  if (key == '-') {
    threshold -= 10;
  }

  if (key == '=') {
    threshold += 10;
  }
}