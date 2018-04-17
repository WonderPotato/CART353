class KinectSkeleton {
  
  //JOINT VARIABLES
  int jointSize = 10;
  
  //POSITION OF JOINTS
  
  //head joints
  float headX;
  float headY;
  
  //elbow joints
  float leftElbowX;
  float leftElbowY;
  float rightElbowX;
  float rightElbowY;
  
  //hand joints
  float leftHandX;
  float leftHandY;
  float rightHandX;
  float rightHandY;
  
  float rightShoulderX;
  float rightShoulderY;
  float leftShoulderX;
  float leftShoulderY;
  
  float wristRightX;
  float wristRightY;
  float wristLeftX;
  float wristLeftY;
  
  

  void displaySkeleton(){
      ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();

    //individual JOINTS
    for (int i = 0; i < skeletonArray.size(); i++) {
      KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
      if (skeleton.isTracked()) {
        KJoint[] joints = skeleton.getJoints();
        
        //color of skeleton
        color col  = skeleton.getIndexColor();
        fill(255);
        stroke(255);
        drawBody(joints);
  
        //draw different color for each hand state
        drawHandState(joints[KinectPV2.JointType_HandRight]);
        drawHandState(joints[KinectPV2.JointType_HandLeft]);
      }
    }
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

  //// Right Leg
  drawBone(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight);
  drawBone(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_AnkleRight);
  drawBone(joints, KinectPV2.JointType_AnkleRight, KinectPV2.JointType_FootRight);

  //// Left Leg
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
  
  //get the X,Y coordinates of joints
  
  //shoulders
  rightShoulderX = joints[KinectPV2.JointType_ShoulderRight].getX();
  rightShoulderY = joints[KinectPV2.JointType_ShoulderRight].getY();
  leftShoulderX = joints[KinectPV2.JointType_ShoulderLeft].getX();
  leftShoulderY = joints[KinectPV2.JointType_ShoulderLeft].getY();
  
  
  
  //elbows
  rightElbowX = joints[KinectPV2.JointType_ElbowRight].getX();
  rightElbowY = joints[KinectPV2.JointType_ElbowRight].getY();
  leftElbowX = joints[KinectPV2.JointType_ElbowLeft].getX();
  leftElbowY = joints[KinectPV2.JointType_ElbowLeft].getY();

  //wrists
  wristRightX = joints[KinectPV2.JointType_WristRight].getX();
  wristRightY = joints[KinectPV2.JointType_WristRight].getY();
  wristLeftX = joints[KinectPV2.JointType_WristLeft].getX();
  wristLeftY = joints[KinectPV2.JointType_WristLeft].getY();
  
  
  
  //hands
  rightHandX = joints[KinectPV2.JointType_HandRight].getX();
  rightHandY = joints[KinectPV2.JointType_HandRight].getY();
  leftHandX = joints[KinectPV2.JointType_HandLeft].getX();
  leftHandY = joints[KinectPV2.JointType_HandLeft].getY();
  
  //head
  headX = joints[KinectPV2.JointType_Head].getX();
  headY = joints[KinectPV2.JointType_Head].getY();
}

//draw joint
void drawJoint(KJoint[] joints, int jointType) {
  pushMatrix();
  translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
  ellipse(0, 0, jointSize, jointSize);
  popMatrix();
}

//draw bone
void drawBone(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
  ellipse(0, 0, jointSize, jointSize);
  popMatrix();
  line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
}

//draw hand state
void drawHandState(KJoint joint) {
  noStroke();
  handState(joint.getState());
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  ellipse(0, 0, jointSize, jointSize);
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
    break;
  case KinectPV2.HandState_Lasso:
    fill(0, 0, 255);
    break;
  case KinectPV2.HandState_NotTracked:
    fill(255, 255, 255);
    break;
  }
}
}