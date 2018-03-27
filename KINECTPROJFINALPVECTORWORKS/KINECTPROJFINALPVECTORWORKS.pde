import KinectPV2.KJoint;
import KinectPV2.*;
import controlP5.*;
import processing.opengl.*;

import oscP5.*;
import netP5.*;

ControlP5 cp5;

KinectPV2 kinect;


ParticleSystem ps;

Repeller[] repellers;



int depth = 600;

OscP5 oscP5;

NetAddress myBroadcastLocation;

//boop this is the traacker boop
 PVector handRight;
  PVector handLeft;

float zVal = 1;
float rotX = PI;

String lsend;

OscMessage VectorMsg = new OscMessage("/skeleton");

float PARTICLE_RADIOUS = 3.0;
float PARTICLE_NUM = 1000;
float FORCE = 2.0;
float a1; 
ArrayList<ParticleSystem> systems;

void setup() {
  size(1024, 768, P3D);
  
  cp5 = new ControlP5(this);
  
  cp5.addSlider("depth")
    .setPosition(50,600)
    .setRange(0,1000)
    .setSize(200,20)
    .setValue(600)
    .setColorBackground(color(50,50,50))
    .setColorForeground(color(100,100,100))
    .setColorActive(color(150,150,150))
  ;

  systems = new ArrayList<ParticleSystem>();

  kinect = new KinectPV2(this);

  kinect.enableColorImg(true);

  //enable 3d  with (x,y,z) position
  kinect.enableSkeleton3DMap(true);

  kinect.init();
  
      repellers = new Repeller[10];

  for (int i = 0; i < repellers.length; i++) {
    repellers[i] = new Repeller(width/2 -20, height/2);
  }
  
  oscP5 = new OscP5(this, 6882); 
  myBroadcastLocation = new NetAddress("localhost", 6884);
}

void draw() {
  background(0);

  image(kinect.getColorImage(), 0, 0, 320, 240);

  //translate the scene to the center 
  pushMatrix();
  translate(width/2, height/2, depth);
  scale(zVal);
  rotateX(rotX);

  ArrayList skeletonArray =  kinect.getSkeleton3d();

 // ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

  //individual JOINTS
  VectorMsg = new OscMessage("/skeleton");
  lsend = "";
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      //draw different color for each hand state
      drawHandState(joints[KinectPV2.JointType_HandRight]);
      drawHandState(joints[KinectPV2.JointType_HandLeft]);
      //implement specific joint name from pv2 kinect joint array of skeleton!!!!!!!!!
     handRight = new PVector(joints[KinectPV2.JointType_HandRight].getX(),joints[KinectPV2.JointType_HandRight].getY(),joints[KinectPV2.JointType_HandRight].getZ());
     handLeft = new PVector(joints[KinectPV2.JointType_HandLeft].getX(),joints[KinectPV2.JointType_HandLeft].getY(),joints[KinectPV2.JointType_HandLeft].getZ());
      //Draw body
      color col  = skeleton.getIndexColor();
      stroke(col);
      drawBody(joints);
    }
  }
  VectorMsg.add(lsend);
  oscP5.send(VectorMsg, myBroadcastLocation);
  popMatrix();
//noStroke();

  for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
  }
  if (systems.isEmpty()) {
    fill(255);
    textAlign(CENTER);
    text("click mouse to add particle systems", width/2, height/2);
  }

int jointHand = KinectPV2.JointType_HandTipLeft;

drawJoint(1, jointHand);

PVector point1 = new PVector(-500, 0, 1500);
PVector point2 = new PVector(500, 0, 700);

  fill(255, 0, 0);
  text(frameRate, 50, 50);
}

void drawJoint(int userID, int jointId) {
// make a vector to store the left hand
PVector jointPosition = new PVector();
// put the position of the left hand into that vector
//kinect.getJointPositionSkeleton(userID, jointId, jointPosition);
// convert the detected hand position to "projective" coordinates that will match the depth image
PVector convertedJointPosition = new PVector();
//kinect.convertRealWorldToProjective(jointPosition, convertedJointPosition);
// and display it
fill(255, 0, 0);

float ellipseSize = map(convertedJointPosition.z, 700, 2500, 50, 1);
ellipse(convertedJointPosition.x, convertedJointPosition.y, ellipseSize, ellipseSize);
}

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

void drawJoint(KJoint[] joints, int jointType) {
  strokeWeight(3.0f + joints[jointType].getZ()*4);
  point(joints[jointType].getX()*40, joints[jointType].getY()*40, joints[jointType].getZ()*40);
}

void drawBone(KJoint[] joints, int jointType1, int jointType2) {
  strokeWeight(1);
  line(joints[jointType1].getX()*40, joints[jointType1].getY()*40, joints[jointType1].getZ()*40,joints[jointType2].getX()*40, joints[jointType2].getY()*40, joints[jointType2].getZ()*40);
  strokeWeight(2.0f + joints[jointType2].getZ()*4);
  point(joints[jointType2].getX()*40, joints[jointType2].getY()*40, joints[jointType2].getZ()*40);
  lsend = lsend + joints[jointType1].getX() + "," + joints[jointType1].getZ() + "," + joints[jointType1].getY() + "*";
  lsend = lsend + joints[jointType2].getX() + "," + joints[jointType2].getZ() + "," + joints[jointType2].getY() + "*";
}

void drawHandState(KJoint joint) {
  handState(joint.getState());
  //strokeWeight(5.0f + joint.getZ()*20);
 // point(joint.getX()*40, joint.getY()*40, joint.getZ()*40);
 println("LEFT:: "+joint.getX()*40);
}

void handState(int handState) {
  switch(handState) {
  case KinectPV2.HandState_Open:
    stroke(0, 255, 0);
    break;
  case KinectPV2.HandState_Closed:
    //stroke(255, 0, 0);
      //create particles need to make it come out of hands joint!!!!  howwwwww
     // systems.add(new ParticleSystem(2, new PVector(handLeft.x, handLeft.y)));
    // fill(255,0,0);
    // ellipse(handLeft.x*40, handLeft.y*40,50,50);
     strokeWeight(5);
    point(handLeft.x*40, handLeft.y*40 , handLeft.z*40);
     //println(handLeft.x*40);
    break;
  case KinectPV2.HandState_Lasso:
    stroke(0, 0, 255);
       //lasso movement supposed to appear at finger tips but appears at 0,0
    //systems.add(new ParticleSystem(1, new PVector(KinectPV2.JointType_HandTipLeft, KinectPV2.JointType_HandTipRight,0)));
  
    break;
  case KinectPV2.HandState_NotTracked:
    stroke(100, 100, 100);
    break;
  }
}