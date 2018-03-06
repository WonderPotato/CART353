# Project SHIFT + SPACE

## Foreword 

 *I feel as though I really tried to make it work with the kinect V1, and was being really 
 stubborn about its functionality, and so there was a sense of letting go after the 
 prototype due to its outcome, but crack on! the show must go on!! Although it was a 
 fun experimentation process, frustrating but very informative and fun as well! That is 
 why it is only after the prototype that I  have decided to turn to using the kinect V2 
 instead for the remainder of this project, and thus the reason behind the current status 
 of my project.* :shit:


![alt text](https://github.com/WonderPotato/CART353/blob/master/Assignments/InitialPrototype/images/initialTracker1.PNG "tracker1")

## Artist's Statement

Create an Action/Reaction environment for the individual to immerse themselves in.  An interaction to distract the individual from technology by surrounding them with technology.  I wish to create a program that will track the body of the user, and by having certain parts identified, will allow for custom reactionary functions when interacting with floating entities in the virtual environment.  The experience needs to be tranquil and engaging all at once, to be able to bring the individual a sense of comfort in a world where all things technology are distracting and accumulative chaos.  By bringing the user into a world of technology, they get to step away from their own technology for just a few moments of their time.  Having the environment be of darkness and minimalistic visuals in the background, brings emphasis onto the entities, making them glow and orbit in independent behaviours around the user, making the individual pass off as the sun of the solar system, being in control of themselves, while trying to interact with an unknown environment.  I believe in creating a peaceful and neutral environment, which will allow the user to create their own experience with technology in an engaging and stimulating way.  I am hoping this project can bring some inspiration towards augmented and virtual realities, and really explore the ways humans interact with non existent materiality in virtual surroundings. This project has the potential to delve deeper into the reactions of humans with their own interactivity with virtual and projected environments.  


## The Setup:

Kinect V1 had limited and deprecated functionalities, due to unfortunate events and 
updates in software and hardware which were out of my control, and not to my 
knowledge on certain aspects when starting the project. 
For example, the library Box2D. which had great examples and functions, was unable 
to be implemented as it required processing version 2, SimpleOpenNI windows 32bit, 
and other formats, and bringing it all together with the kinect, it simply did not work, 
therefore I was unable to experiment with the great source of examples and code from 
the Box2D library. 
 
Turning to Kinect V2, for which I decided after this prototype was completed that I 
would continue the project with the new version of the kinect instead, the possibilities 
are now greatly achievable and realistic, due to the device already having implemented 
libraries that address the needs of this project.  Such as skeleton tracking, background 
removal, silhouette masking, and many more functions that were not achievable within 
the confines of the kinect V1 model 1414. 

![alt text](https://github.com/WonderPotato/CART353/blob/master/Assignments/InitialPrototype/images/initialTracker2.PNG "tracker2")

## Stick To The Code:

Code wise, turning over the page and onto a new chapter, I have learned the 
possibilities from researching and trial and errors with Kinect V1 showing the potential 
to be achieved.  Going to the next version of the kinect, I will be working with its core 
libraries, libfreenect freenect V2, examples from shiffman's books and codes, and 
more coding resources from forums. 
The code will apply the action reaction experience from the concept statement, by 
working with the skeleton tracking, which has various body parts and limbs coded as 
seperate areas of detection and modifications, each will be able to produce a unique 
reaction with the surrounding entities in the environment of the experience.  Therefore, 
when the user moves a certain area of their own body to collide or "touch" an entity, it 
will react in a way that is mysterious and unique, as well as the intensity of such 
movements, the reaction can then become amplified or simply executed as a distant 
whisper. 

![alt text](https://github.com/WonderPotato/CART353/blob/master/Assignments/InitialPrototype/images/initialTracker1.PNG "tracker3")

## The Prototype: 
 
The drive behind the prototype for this project had various angles to it.  Setting up the 
kinect to the computer and getting a visual response from it was the first goal, after 
some downloading and installing of various programs following the instructions, things 
got going.  then not so much.... more digging and solutions were found..... then the 
libraries arrived, and things started spiralling out of control!  things crashed examples 
did not open or run at all, various error message, all hope was nearly sort of lost... 
But in the end the basic goal of this prototype was achieved. Create a particle system, or any form of shape moving or falling on the screen, then to 
have to user interact with said particles or shapes by being a repeller or a blocker. 
Nature of code came in handy there ha! 
finding different examples and new libraries, the goal was achieved, with some outside 
help of course (ahem sabine!!!) anyways the functions I wanted to implicate were right 
it was just a matter of placing the right thing in the right place. and I did. and voila a 
working prototype.  by achieving the prototype, I discovered the new direction of the 
project, upgrading to kinect V2.

![alt text](https://github.com/WonderPotato/CART353/blob/master/Assignments/InitialPrototype/images/initialTracker1.PNG "tracker4")

## Research Questions Initially:

- Will it work?  
- If so, how will it create a raw visual representation of my goal for this project? 
- Can this work for my concept? 
- Will this project create the experience I intend to present?  
- How will this installation further innovate in virtual surroundings?  
- Can it have an effect on augmented reality or virtual reality at all?

## Research Questions After Prototype:

- How far can the kinect V2 and its libraries take this project? 
- Can I really achieve my vision? 
- Will having various reactions really portray the experience?
- Will the final product change from the concept?
- How can I make it a tranquil yet engaging experience?

## Further Reading:

I know I will be using the Kinect PV2 library for the remainder of the project and other libraries will surely be discovered as well....

- https://github.com/ThomasLengeling/KinectPV2 

Some examples from the library that will be thoroughly tested out:

- TestImages, Test all Frames/Images for the Kinect. 
- SkeletonMaskDepth, Skeleton positions are mapped to match the depth and body index frames. 
- SkeletonColor, Skeleton is mapped to match the color frame. 
- Skeleton3d, 3d Skeleton example needs love. 
- SimpleFaceTracking, simple face tracking with mode detection. 
- PointCloudOGL, Point cloud depth render using openGL and shaders. 
- PointCloudDepth, point cloud in a single 2d Image and threshold example. 
- PointCloudColor, Point cloud in color, using openGL and shaders. 
- MaskTest, Body Index test, and body index with depth. 
- Mask_findUsers, find number of users base on body index information. 
- MapDepthToColor, depth to color mapping, depth frame is aligned with color frame. 
- HDFaceVertex, Face vertices are match with the color frame. 
- HDColor, 1920 x 1080 RGB frame. 
- DepthTest, Depth test with raw depth data. 
- CoordinateMapperRGBDepth, example broken, check 0.7.2 version. 
- RecordPointCloud, simple OBJ recording of the point cloud positions. 
- OpenCV examples: 
- Live Capture App 
- Find Contours with depth or bodyIndex 



