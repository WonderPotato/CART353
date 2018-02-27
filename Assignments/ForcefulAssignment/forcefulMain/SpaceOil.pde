//this class will be the environment to affect the floating stuff
//since this 2D world will be in space
//the force of this class will be of a gaseous state
//so it will sort of behave like a liquid
//only it won't because it's a gas
//so using the gravitational force formula
//and other stuff this class will do science physics stuff on everything
//this class will be enclosed in a specific area of the world
//although t's at the top of the canvas so we will have to reverse engineer this if we can


class SpaceOil{
  
  //background
  
//drag / liquid / gaseous state needs different variables for its formula coefficient etc

float x,y,w,h,c;


  
  SpaceOil(float xEN, float yEN, float wEN, float hEN, float cEN) {
  
  //cool science formula
  x = xEN;    //location x
  y = yEN;    //location y  
  w = wEN;    //width
  h = hEN;    //height
  c = cEN;    //coefficient of drag for formula
    
  }
  
  
  
  
  //boolean isInsideGas(
  ///gas area 
  //size width/3 height/3
  
  //is there anything inside the gas environment???
  boolean contains(Potato potatoBot) {
    
    PVector l = potatoBot.location;
    if (l.x > x && l.x < x + w && l.y > y && l.y < y + h) {
     return true;
    } else {
      return false;
    }
   }
  
  
 // void drag(SpaceOil 1) {
    PVector drag(Potato potatoBot) {
      //magnitude is coefficient * speed squared
      float speed = potatoBot.velocity.mag();
      float dragMagnitude = c * speed * speed;
      
      //direction is inverse of velocity
      PVector drag = potatoBot.velocity.copy();
      drag.mult(-1);
      
      //scale accordin to magnitude
      drag.setMag(dragMagnitude);
      return drag;
      
    }
    
    
    
  //}
  
  
  
  void display() {
  
    noStroke();
    fill(237, 180, 49, 150);
    rect(x, y, w, h);
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}