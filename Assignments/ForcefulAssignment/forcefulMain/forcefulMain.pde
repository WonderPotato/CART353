/**
*    Michelle Samson
*    27037600  
*    CART 353 WINTER 2018 
*    Professor Rilla Khaled
*
*    Forceful Assignment
*
*    Due Date: February 27th, 2018
*
*    Katamari wannabee
**/



//declare Potato object
Potato potatoOrigin;

//SpaceOil object
SpaceOil firstOiler;

PImage backgd;

void setup(){
  
  size(1920, 1080);    //size of the canvas world
    
  //background environment
  backgd = loadImage("chbackground.jpg");
 
  
  //space oil object
  firstOiler = new SpaceOil(0, height/4, width, -height, 0.5);
  
   //create potato object
  potatoOrigin = new Potato(1,1,1);

  
  
}



void draw(){
  
  //background image space 
background(backgd);
 // image(potatoOrigin, mouseX, mouseY);
 
 //some instructions on the background
 textSize(20);
 fill(10);
 textAlign(CENTER);
 text("Move that potato with the up, down, left, and right arrow keys!", width/2, height/2);
 text("Press the SPACEBAR to stop the potato!", width/2, height/2 + 20);
 text("Careful that yellow stuff is gas and will slow you down!", width/2, height/2 + 40);
 text("get those floating carbs and tools!",width/2, height/2 + 60);
 
 //yellow gas spaceoil
  firstOiler.display();
 
  //pushpopmatrix to move the main potato with the mouse coordinate without affecting the rest of the coordinate system
  //pushMatrix();
  //translate(mouseX, mouseY);
 // potatoOrigin.display();
 // popMatrix();
  
  
   //if(potatoOrigin.contains(firstOiler)) {
     //calculate drag force
   //  PVector drag = firstOiler.drag(potatoOrigin);
     //apply drag force to potatoOrigin
     //potatoOrigin.applyForce(drag);
     potatoOrigin.drag(firstOiler);
    // potatoOrigin.update();
 //  }
   
   //gravity scaled by mass
  // PVector gravity = new PVector(0, 0.1*potatoOrigin.mass);
   //apply gravity
  // potatoOrigin.applyForce(gravity);
   
   //update stuff display stuff
   potatoOrigin.keyControls();
   potatoOrigin.update();
   potatoOrigin.display();
   
 
 
 
 
 
 
 
 
  //need location of gas bottom screen
 // if(potatoOrigin.isInside(gas)){
 /*  pushMatrix();
      translate(width/2, height/2);
   rotate((mouseX/width) *2*PI);
   potatoOrigin.display();
   popMatrix();
    
 // }
  //if mouse is near the gas spot, make potatomouse rotate & dragged
  */
  
  
  
  
}


//void window page navigation check out last assignment with increase button = page navigation
//do stuff go to next page