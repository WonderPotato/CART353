import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

import KinectPV2.KJoint;
import KinectPV2.*;
import controlP5.*;
import processing.opengl.*;

import oscP5.*;
import netP5.*;

ControlP5 cp5;

KinectPV2 kinect;



// An angle to rotate around the scene
float angle = 0;

int depth = 600;

OscP5 oscP5;

NetAddress myBroadcastLocation;

//boop this is the traacker boop
 PVector handRight;
  PVector handLeft;


//vector instantiation of body parts

//head
PVector headMain;

//shoulders

PVector shoulderLeft;
PVector shoulderRight;

//elbows

PVector elbowLeft;
PVector elbowRight;

//hip

PVector hipLeft;
PVector hipRight;

//Knees

PVector kneeLeft;
PVector kneeRight;

//feet

PVector footLeft;
PVector footRight;










float zVal = 1;
float rotX = PI;

String lsend;

OscMessage VectorMsg = new OscMessage("/skeleton");

float PARTICLE_RADIOUS = 3.0;
float PARTICLE_NUM = 1000;
float FORCE = 2.0;
float a1; 

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


  kinect = new KinectPV2(this);

  kinect.enableColorImg(true);

  //enable 3d  with (x,y,z) position
  kinect.enableSkeleton3DMap(true);

  kinect.init();
  
 // handRight = new PVector();
  
  
  PVector footLeft;
PVector footRight;


  oscP5 = new OscP5(this, 6882); 
  myBroadcastLocation = new NetAddress("localhost", 6884);
}

void draw() {
  background(0);

  image(kinect.getColorImage(), 0, 0, 320, 240);

  //translate the scene to the center 
  pushMatrix();
  translate(width/2, height/2);
  scale(zVal);
  rotateX(rotX);

  ArrayList skeletonArray =  kinect.getSkeleton3d();

 // ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

  //individual JOINTS
  VectorMsg = new OscMessage("/skeleton");
  lsend = "";
  
  //cycle through skeleton arry of joints then draw each joints pvector
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();

      //draw different color for each hand state
      drawHandState(joints[KinectPV2.JointType_HandRight]);
      drawHandState(joints[KinectPV2.JointType_HandLeft]);
      
      //draw all the pvector body parts!!
      
      //implement specific joint name from pv2 kinect joint array of skeleton!!!!!!!!!
      //hands
     handRight = new PVector(joints[KinectPV2.JointType_HandRight].getX(),joints[KinectPV2.JointType_HandRight].getY(),joints[KinectPV2.JointType_HandRight].getZ());
     handLeft = new PVector(joints[KinectPV2.JointType_HandLeft].getX(),joints[KinectPV2.JointType_HandLeft].getY(),joints[KinectPV2.JointType_HandLeft].getZ());
     
     //head
     headMain = new PVector(joints[KinectPV2.JointType_Head].getX(),joints[KinectPV2.JointType_Head].getY(),joints[KinectPV2.JointType_Head].getZ());

     //shoulders
     shoulderLeft = new PVector(joints[KinectPV2.JointType_ShoulderLeft].getX(), joints[KinectPV2.JointType_ShoulderLeft].getY(), joints[KinectPV2.JointType_ShoulderLeft].getZ());
     shoulderRight = new PVector(joints[KinectPV2.JointType_ShoulderRight].getX(), joints[KinectPV2.JointType_ShoulderRight].getY(), joints[KinectPV2.JointType_ShoulderRight].getZ());
fill(200,30,30);
strokeWeight(50);
point(shoulderLeft.x*40, shoulderLeft.y*40, shoulderLeft.z*40);
     //elbows
     elbowRight = new PVector(joints[KinectPV2.JointType_ElbowRight].getX(), joints[KinectPV2.JointType_ElbowRight].getY(), joints[KinectPV2.JointType_ElbowRight].getZ());
     elbowLeft = new PVector(joints[KinectPV2.JointType_ElbowLeft].getX(), joints[KinectPV2.JointType_ElbowLeft].getY(), joints[KinectPV2.JointType_ElbowLeft].getZ());
     
     //hip
     hipLeft  = new PVector(joints[KinectPV2.JointType_HipLeft].getX(), joints[KinectPV2.JointType_HipLeft].getY(), joints[KinectPV2.JointType_HipLeft].getZ());
     hipRight  = new PVector(joints[KinectPV2.JointType_HipRight].getX(), joints[KinectPV2.JointType_HipRight].getY(), joints[KinectPV2.JointType_HipRight].getZ());

     //Knees
     kneeRight = new PVector(joints[KinectPV2.JointType_KneeRight].getX(), joints[KinectPV2.JointType_KneeRight].getY(), joints[KinectPV2.JointType_KneeRight].getZ());
       kneeLeft  = new PVector(joints[KinectPV2.JointType_KneeLeft].getX(), joints[KinectPV2.JointType_KneeLeft].getY(), joints[KinectPV2.JointType_KneeLeft].getZ());

     //feet
     footLeft = new PVector(joints[KinectPV2.JointType_FootLeft].getX(), joints[KinectPV2.JointType_FootLeft].getY(), joints[KinectPV2.JointType_FootLeft].getZ());
     footRight = new PVector(joints[KinectPV2.JointType_FootRight].getX(), joints[KinectPV2.JointType_FootRight].getY(), joints[KinectPV2.JointType_FootRight].getZ());
     
     
 
     
     strokeWeight(25);
     fill(255,0,50);
     // point
     // float hipmove = point(hipLeft.x *40, hipLeft.y*40, hipLeft.z*40);
     //ellipse(hipLeft.x*40, hipLeft.y*40, 50, 50);
     
   
     
     
     
     
     

     
     
     

     
     
     
     
     
     
     
     
     
     
     
      //Draw body
      color col  = skeleton.getIndexColor();
      stroke(col);
      drawBody(joints);
    }
  }
  
  popMatrix();
  
  
 pushMatrix();
       
    // float ellipseSize = map(hipLeft.x*40, hipLeft.y*40, hipLeft.z*40, 1.02, 2.3);
//ellipse(hipLeft.x*40, hipLeft.y*40, ellipseSize, ellipseSize);
     
     
     
     
        translate(200, 300, 200);
rotateY(1.25);
rotateX(-0.4);
noStroke();
box(10);
     
     
  VectorMsg.add(lsend);
  oscP5.send(VectorMsg, myBroadcastLocation);
  popMatrix();
//noStroke();



 // systems.add(new ParticleSystem());
  //ps.repel(handRight);
       //handRight.repeller(ps); //add something to attract stuff to this guy
//systems.add(new ParticleSystem(joints[KinectPV2.JointType_FootLeft].getX()));
//w PVector(handLeft.x, handLeft.y)));
  
  
   

//s.(handRight);

  // Display the Sun
 // handRight.display();

  // All the Planets




 /* if (systems.isEmpty()) {
    fill(255);
    textAlign(CENTER);
    text("click mouse to add particle systems", width/2, height/2);
  }*/
// println("sun : :" + s.position.x );

  fill(255, 0, 0);
  text(frameRate, 50, 50);
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
// println("LEFT:: "+joint.getX()*40);
}

void handState(int handState) {
  switch(handState) {
  case KinectPV2.HandState_Open:
    stroke(0, 255, 0);
    break;
  case KinectPV2.HandState_Closed:
    stroke(255, 0, 0);
      //create particles need to make it come out of hands joint!!!!  howwwwww
     // systems.add(new ParticleSystem(width/2, new PVector(hipLeft.x*40, hipLeft.y*40, hipLeft.z*40)));
    // fill(255,0,0);
    //systems.position(kneeLeft);
    // ellipse(handLeft.x*40, handLeft.y*40,50,50);
     //strokeWeight(25);
   // point(handLeft.x*40, handLeft.y*40 , handLeft.z*40);
     println(handLeft.x*40);
    break;
  case KinectPV2.HandState_Lasso:
    stroke(0, 0, 255);
   
  
    break;
  case KinectPV2.HandState_NotTracked:
    stroke(100, 100, 100);
    break;
  }
}



//classes