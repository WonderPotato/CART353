

/*
Thomas Sanchez Lengeling.
 http://codigogenerativo.com/

 KinectPV2, Kinect for Windows v2 library for processing

 Skeleton color map example.
 Skeleton (x,y) positions are mapped to match the color Frame
 */
import processing.opengl.*;
import KinectPV2.KJoint;
import KinectPV2.*;
import controlP5.*;
import camera3D.*;
KinectPV2 kinect;

ParticleSystem ps;

Repeller[] repellers;
float PARTICLE_RADIOUS = 3.0;
float PARTICLE_NUM = 1000;
float FORCE = 2.0;
float a1; 
ArrayList<ParticleSystem> systems;

void setup() {
  size(1920, 1080, P3D);
noStroke();
  lights();
 // camera(0, 0, -250, 0, 0, 0, 0, 1, 0);
  kinect = new KinectPV2(this);
  systems = new ArrayList<ParticleSystem>();

  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);

  kinect.init();
  
    repellers = new Repeller[10];

  for (int i = 0; i < repellers.length; i++) {
    repellers[i] = new Repeller(width/2 -20, height/2);
  }
  
   sphereDetail(10);
  
  
  
   //ps = new ParticleSystem(new PVector(width/2, 50));
}



//DRAW BODY
void drawBody(KJoint[] joints) {
  drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_Neck);
  drawBone(joints, KinectPV2.JointType_Neck, KinectPV2.JointType_SpineShoulder);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineMid);
  drawBone(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_SpineBase);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderRight);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderLeft);
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipRight);
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipLeft);

  // Right Arm
  drawBone(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_ElbowRight);
  drawBone(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_WristRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_HandRight);
  drawBone(joints, KinectPV2.JointType_HandRight, KinectPV2.JointType_HandTipRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_ThumbRight);

  // Left Arm
  drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ElbowLeft);
  drawBone(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_WristLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_HandLeft);
  drawBone(joints, KinectPV2.JointType_HandLeft, KinectPV2.JointType_HandTipLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_ThumbLeft);

  // Right Leg
  drawBone(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight);
  drawBone(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_AnkleRight);
  drawBone(joints, KinectPV2.JointType_AnkleRight, KinectPV2.JointType_FootRight);

  // Left Leg
  drawBone(joints, KinectPV2.JointType_HipLeft, KinectPV2.JointType_KneeLeft);
  drawBone(joints, KinectPV2.JointType_KneeLeft, KinectPV2.JointType_AnkleLeft);
  drawBone(joints, KinectPV2.JointType_AnkleLeft, KinectPV2.JointType_FootLeft);

  drawJoint(joints, KinectPV2.JointType_HandTipLeft);
  drawJoint(joints, KinectPV2.JointType_HandTipRight);
  drawJoint(joints, KinectPV2.JointType_FootLeft);
  drawJoint(joints, KinectPV2.JointType_FootRight);

  drawJoint(joints, KinectPV2.JointType_ThumbLeft);
  drawJoint(joints, KinectPV2.JointType_ThumbRight);

  drawJoint(joints, KinectPV2.JointType_Head);
}

//draw joint
void drawJoint(KJoint[] joints, int jointType) {
  pushMatrix();
  translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
  ellipse(0, 0, 25, 25);
  popMatrix();
}

//draw bone
void drawBone(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
  ellipse(0, 0, 25, 25);
  popMatrix();
  line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
}

//draw hand state
void drawHandState(KJoint joint) {
  noStroke();
  handState(joint.getState());
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  ellipse(0, 0, 70, 70);
  popMatrix();
}

/*
Different hand state
 KinectPV2.HandState_Open
 KinectPV2.HandState_Closed
 KinectPV2.HandState_Lasso
 KinectPV2.HandState_NotTracked
 */
 
void handState(int handState) {
  switch(handState) {
  case KinectPV2.HandState_Open:
    fill(0, 255, 0);
    break;
  case KinectPV2.HandState_Closed:
    fill(255, 0, 0);
    //create particles need to make it come out of hands joint!!!!  howwwwww
      systems.add(new ParticleSystem(2, new PVector(width/2, height/2)));

    break;
  case KinectPV2.HandState_Lasso:
    fill(0, 0, 255);
    //lasso movement supposed to appear at finger tips but appears at 0,0
    systems.add(new ParticleSystem(1, new PVector(KinectPV2.JointType_HandTipLeft, KinectPV2.JointType_HandTipRight,0)));
    break;
  case KinectPV2.HandState_NotTracked:
    fill(255, 255, 255);
    break;
  }
}

void draw() {
  background(0);

  image(kinect.getColorImage(), 0, 0, width, height);

  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
      drawBody(joints);

      //draw different color for each hand state
      drawHandState(joints[KinectPV2.JointType_HandRight]);
      drawHandState(joints[KinectPV2.JointType_HandLeft]);
    }
  }
// iterate over all the fingers found
  // and draw them as a red circle
  noStroke();
  fill(255, 0, 0);
//  PVector positionLeftHandTip = drawHandState(joints[KinectPV2.JointType_HandLeft]);
  //  PVector positionLeftHand =  joints(JointType_HandRight.getX());
   // , joints[jointType].getY(), joints[jointType].getZ()

  //  PVector positionRightHand =   (KinectPV2.JointType_HandRight);
     //[KinectPV2.JointType_HandTipRight]);

   // if (i < 10) {
      // ellipse(position.x - 5, position.y -5, 10, 10);
    //  repellers[i].location = new PVector(position.x -5, position.y -5);
   // }
  
//PVector gravity = new PVector(0, 0.1);
//  ps.applyForce(gravity);
//  ps.addParticle();
 // for ( int i = 0; i < repellers.length; i++) {


 //   ps.applyRepeller(repellers[i]);
 //   repellers[i].display();
 // }
 // ps.run();



  // everything looks better with lights
  lights(); 
 
  fill(255, 0, 0); // red 
  displaySphere(width/2, height/2, 0, 19);
 
  fill(0, 255, 0); // green 
  displaySphere(44, 44, 0, 19);
 
  fill(0, 255, 0); // green 
  displayBox(width/2, 99, 0, 39);
 
  fill(0, 0, 255); // blue 
  displayBox(width/2, 99, -439, 39); // blue box is same x, same, y, same size 
  // but farer away than the green box (-439 instead of 0)
 
  fill(0, 255, 0); // green 
  displayText(30, height-30, 0);
 
  fill(255, 235, 10); // yellow  
  displayText(width-118, height-30, 0);
 
  fill(255, 0, 255); // blue  
  displayText(width-118, height-30, -60); // same x and y, but more far away

  fill(255, 0, 0);
  text(frameRate, 50, 50);
  
   for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
  }
  if (systems.isEmpty()) {
    fill(255);
    textAlign(CENTER);
    text("click mouse to add particle systems", width/2, height/2);
  }
  
  
  
}

void displaySphere(float x, float y, float z, 
  float r) {
 
  // sphere
 
  noStroke();
  pushMatrix();
  translate(x, y, z);
  sphere(r);
  popMatrix();
}
 
void displayBox(float x, float y, float z, 
  float r) {
 
  // box 
 
  noStroke();
  pushMatrix();
  translate(x, y, z); // translate and rotate 
  rotateY(a1); 
  box(r);
  popMatrix();
 
  // rotation 
  a1+=.012;
}
 
void displayText(float x, float y, float z) {
 
  // Text of the coordinates at coordinates:
 
  // This function shows the coordinates x,y,z as text at the screen position 
  // of the coordinates.  
 
  pushMatrix();
  translate(x, y, z); // translate and rotate 
  text(x+","+y+","+z, 
    0, 0);
  popMatrix();
}