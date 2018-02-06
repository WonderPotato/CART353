//Michelle Samson
/*
  ID: 27037600
 CART 353 winter 2018
 Professor Rilla Khaled
 
 //references :
 //https://processing.org/reference/randomGaussian_.html
 //https://processing.org/reference/noise_.html
 //https://processing.org/examples/noisewave.html
 //video from HBO's Westworld season 2 super bowl commercial 2018
 
 //https://www.youtube.com/watch?v=qUmfriZoMw0
 
 //these references were used to symbolizes the fine line between what is real and what is fake, 
 //what is alive and what is merely artificial
 */


//import video library
import processing.video.*;


//declare movie object for recorded video
Movie movieWW;
//to create the second dimension of perlin noise
float yOffset = 0.0;  


void setup() {
  size(1280, 720);
  movieWW = new Movie(this, "WWSeason2.mp4");
  movieWW.loop();
}

void movieEvent(Movie movieWW) {
  movieWW.read();
}

void draw() {
  image(movieWW, 0, 0);

  //inspired from processing reference randomGaussian
  for (int y = 0; y < 1900; y++) {
    float x = randomGaussian() * 15;
    stroke(100, 0, 0, 80);
    strokeWeight(1);
    line(0, y, 0 + random(mouseX), random(mouseY));
  }

  //create a wave of noise in horizontal pixels for the perlin noise
  //inspired from noise wave modified to five the smooth wave a sharper edge lines to depict heart rate...


  //to ensure there is transparency
  noFill();
  stroke(10, 20, 30);
  strokeWeight(25);
  beginShape();

  float xOffset = yOffset;
  for (float x = 0; x <= width; x += 10) {

    //now we calculate the y value according to the perlin noise and then we map it out onto the sketch

    float y = map(noise(xOffset), 0, 1, 400, 600);    //1D perlin noise
    //need tos et the vertex
    vertex(x, y);
    //increment the xoffset dimension of the perlin noise
    xOffset += 0.2;
  }

  //then we increment the yoffset dimension of the perlin noise
  yOffset += 0.02;
  vertex(width, height); 
  vertex(0, height);   
  endShape(CLOSE);
}