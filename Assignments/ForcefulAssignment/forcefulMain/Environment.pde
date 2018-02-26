//this class will be the environment to affect the floating stuff
//since this 2D world will be in space
//the force of this class will be of a gaseous state
//so it will sort of behave like a liquid
//only it won't because it's a gas
//so using the gravitational force formula
//and other stuff this class will do science physics stuff on everything
//this class will be enclosed in a specific area of the world
//specifically the left side as a rectangle with maybe some wavy borders who knows tbh




class Environment{
  
  //background
  
//drag / liquid / gaseous state needs different variables for its formula coefficient etc

float x,y,w,h,c;


  
  Environment(float xEN, float yEN, float wEN, float hEN, float cEN) {
  
  //cool science formula
  x = xEN;
  y = yEN;
  w = wEN;
  h = hEN;
  c = cEN;
    
  }
  
  void display() {
  
    noStroke();
    fill(200, 45, 120);
    rect(x, y, w, h);
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}