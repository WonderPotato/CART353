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
  firstOiler = new SpaceOil(0, height/4, width, -height, 0.3);
  
   //create potato object
  potatoOrigin = new Potato(1,1,1);

  
  
}



void draw(){
  
  //background image space 
background(backgd);
 // image(potatoOrigin, mouseX, mouseY);
  firstOiler.display();
 
  //pushpopmatrix to move the main potato with the mouse coordinate without affecting the rest of the coordinate system
  pushMatrix();
  translate(mouseX, mouseY);
  potatoOrigin.display();
  popMatrix();
  
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