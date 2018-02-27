//this class is for the flying objects 
//they cannot be controlled by the user
//these flying chips will have their forces on the random
//meaning some will be big or small
//some will have varying masses




class FloatFry{
  
  
  
  
  int maxImages = 14;   //total# of images 
  int imageIndex = 0;    //initial image to displayed
  
 // PImage[] fries = new PImage[maxImages];
  PVector location;
  PVector velocity;
  PVector acceleration;
  PImage friesSprite; 
  float mass;

  
  //for(int i = 0; i < maxImages; i++) {
  // fries[i] = loadImage(str +[i]+".png"); 
    
    
    
 // }
  
  
  
    FloatFry(float m, PVector location_ , PImage fries) {
    
  //  fries = loadImage("something.png");
    //imageMode(CENTER);
    mass = m;
    
    location = location_;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    //image variable for input 
    friesSprite = fries;
    
  }
  
  
  
  //array of each icon
  //random position movement
  //size same either normal or small
  //mass
  //location
  //array[13];
  
  //("chipBag.png","frenchFries.png","friesCup.png", "lilPotato.png", "mashedTaters.png",
  //"masher.png", "MrPotatoHd.png", "peeler.png", "potatoCubes.png", "potatoWavyChip.png", "potatoWedges.png",
  //"potatowholecut.png", "pringles.png", "sackPotatoes.png");
  
    
  void attractor() {
    
    
  }
  
  
  
  void collider() {
    
    
  }
  
  
  
  void update(){
    
    
  }
  
  void display() {
    imageMode(CENTER);
    image(friesSprite, random, random, 120, 120);
    
  }
  
  
  
  
   void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
    //y check up
    
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height; 
    } else if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
    
    
  }
  
  
  
  
  
  
  
  
}