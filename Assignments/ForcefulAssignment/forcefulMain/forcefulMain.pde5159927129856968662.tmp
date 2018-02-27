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
*    you are floating space, and suddenly you get the munchies!
*    welcome to Space Munchies!!
*    Where all the best things floating around are carbs or tools to help you consume those carbs!
**/




//image array object
PImage[] frySprites = new PImage[14];

//object array of floating carbs
FloatFry[] friesCarb = new FloatFry[14];


//declare Potato object
Potato potatoOrigin;

//SpaceOil object
SpaceOil firstOiler;

PImage backgd;

PVector gravitySpace = new PVector(0,0.1);
PVector latchHo = new PVector(0, 1);  //attract force to apply when contact is made

void setup(){
  
  size(1080, 720);    //size of the canvas world
    
  //background environment
  backgd = loadImage("chbackground.jpg");
 
  
  //space oil object
  firstOiler = new SpaceOil(0, height/4, width, -height, 5);
  
  PImage mainPotato = loadImage("potatoMain.png");
   //create potato object
  potatoOrigin = new Potato(2, width/2, height/2, mainPotato);   //start the potato at the center
  

//load images into array
for (int i = 0; i < frySprites.length; i++) {
  frySprites[i] = loadImage("potato"+i+".png");
}

//load the sprites into object array
  for(int i = 0; i < friesCarb.length; i++) {
        int index = int(random(0, frySprites.length));
    friesCarb[i] = new FloatFry(random(1, 9), 0, height, frySprites[index]);
  // friesCarb[i] = new FloatFry(random(0.1,10), new PVector(int(random(12, 1800)), int(random(12, 1000))), frySprites[index]); 
    
  }
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
 text("Press the SPACEBAR to stop the potato!", width/2, height/2 + 40);
 text("Careful that yellow stuff is gas and will slow you down!", width/2, height/2 + 80);
 text("get those floating carbs and tools!",width/2, height/2 + 120);
 
 //yellow gas spaceoil
  firstOiler.display();
 
  
  //make wind and gravity forces 
  PVector wind = new PVector(0.01,0);
   // PVector gravity = new PVector(0,0.1);
  
  for (int i = 0; i < friesCarb.length; i++) {

    if(firstOiler.contains(friesCarb[i])) {
      
        //calculate drag force
     PVector dragForce = firstOiler.drag(friesCarb[i]);
     //apply drag force to potatoOrigin
     friesCarb[i].applyForce(dragForce);
    
   }
    
    PVector gravity = new PVector(0, -0.1*friesCarb[i].mass);
    //apply gravity
       
    friesCarb[i].applyForce(wind);
    friesCarb[i].applyForce(gravity);
    friesCarb[i].update();
    friesCarb[i].display();
    friesCarb[i].checkEdges();
    
  }
  
  
  //display potato and stuff
  potatoOrigin.displaySprite();
 potatoOrigin.applyForce(wind);
   // potatoOrigin.applyForce(gravitySpace);
       potatoOrigin.checkEdges();
          potatoOrigin.keyControls();
             potatoOrigin.update();

  
   if(firstOiler.contains(potatoOrigin)) {
     //calculate drag force
     PVector dragForce = firstOiler.drag(potatoOrigin);
     //apply drag force to potatoOrigin
     potatoOrigin.applyForce(dragForce);
     
                  potatoOrigin.update();


   }
  
  if(potatoOrigin.insideTheGas(firstOiler)) {
    
    //if the potato goes through the gas slow down!!
    potatoOrigin.dragula(firstOiler);
    potatoOrigin.update();
  
  }
  
  
 //if the potato makes contact with a floating carb
 //same location
 //boolean
 //for loop of the floating carbs
 for (int  i = 0; i < friesCarb.length; i++) {
   
   //check if the carbs and potato touched and then we keep them together foreverrrrrr
   if(potatoOrigin.floatingCollision(friesCarb[i])) {
     //ATTRACT FUNCTION
     potatoOrigin.attractor(friesCarb[i]);
     //keep a force applied so they stay together
     friesCarb[i].applyForce(latchHo);
     //update friessss
     friesCarb[i].update();
     friesCarb[i].checkEdges();
     
   }
   
}
  
}