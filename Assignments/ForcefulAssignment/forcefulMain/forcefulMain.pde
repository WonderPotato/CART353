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
PImage backgd;
void setup(){
  
  size(1920, 1080);    //size of the canvas world
    
  //background environment
  backgd = loadImage("chbackground.jpg");
  //create potato object
  
  potatoOrigin = new Potato();

  
  
}



void draw(){
  
  //background image space 
background(backgd);
 // image(potatoOrigin, mouseX, mouseY);
  potatoOrigin.display();
  
}


//void window page navigation check out last assignment with increase button = page navigation
//do stuff go to next page