class Remix { 
  
//10 inches = 600 pixels

//declare image variables
PImage remixImage;
PImage remixImage2;

//position variables
float xPos, yPos;

  Remix (PImage img) {
    remixImage = img;
  }
  
  //to display
  void display() {
   image(remixImage, xPos, yPos); 
  }
  
  
  //------------------------method 1--------------------------------------
  ///Blending two images by using the 4 arrow keys     for 4 different blend modes 
  //remix #1
  
  void xKeyBlend(PImage img, PImage img2) {
    remixImage = img;
    
 remixImage2 = img2;

  img = loadImage("image1.jpg");
  img2 = loadImage("image2.jpg");

background(200);
image(img2, -50, -20);
image(img, 500, 0);
blend(-50, 500, 600, 600, 700, 500, 600, 600, SCREEN);
blend(-50, 0, 600, 600, 500, 0, 600, 600, SCREEN);
image(img, -50, 500);
image(img2, 500, 500);
blend(0, 500, 600, 600, 700, 500, 600, 600, SCREEN);
blend(0, 0, 600, 600, 500, 0, 600, 600, SCREEN);
} 
  
  //---------------------end of method 1------------------------
  
  
  
  
  //---------------------method 2----------------------------------
  /*
  Create a new image by pointilism from two images
  updatePixels();
  */
  //pointillism example https://processing.org/examples/pointillism.html
  //using two images instead of one = ellipse and rectangles appear simultaneously 
  void pointyTwo(PImage img, PImage img2, int x, int y, int x2, int y2) {
  
     remixImage = img;
    remixImage2 = img2;

  int smallPoint, largePoint;

  img = loadImage("image1.jpg");
  img2 = loadImage("image2.jpg");
  img.resize(1000,0);
  img2.resize(1000,0);
  smallPoint = 40;
  largePoint = 800;
  imageMode(CENTER);
  noStroke();
  //background(255);
   
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
    x = int(random(img.width));
    y = int(random(img.height));
    x2 = int(random(img2.width));
    y2 = int(random(img2.height));
    int loc = x + y * img.width;
    
    //look up color in image
    img.loadPixels();
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    
    noStroke();
    fill(r, g, b, 100);
      ellipse(x, y, pointillize, pointillize);

 
  color pix2 = img2.get(x2, y2);
  fill(pix2, 200);
  rect(x2, y2, pointillize, pointillize);

  }
   
  //------------------------end of method 2---------------------------------
  
  
  
  
  //-------------------------method 3----------------------------------
   //mouseX    interaction #3
  //   Press c to activate the Difference Blend Mode
  void cKeyBlend(PImage img, PImage img2) {
    remixImage = img;
    
 remixImage2 = img2;

  img = loadImage("image1.jpg");
  img2 = loadImage("image2.jpg");

background(0);
image(img2, -50, -20);
image(img, 500, 0);
blend(-50, 500, 600, 600, 700, 500, 600, 600, DIFFERENCE);
blend(-50, 0, 600, 600, 500, 0, 600, 600, DIFFERENCE);
image(img, -50, 500);
image(img2, 500, 500);
blend(0, 500, 600, 600, 700, 500, 600, 600, DIFFERENCE);
blend(0, 0, 600, 600, 500, 0, 600, 600, DIFFERENCE);
} 

  //------------------------end of method 3--------------------------
  
  
  
 
  
  
  
 
  
 
  
  
  
 
  
  
  
  
}