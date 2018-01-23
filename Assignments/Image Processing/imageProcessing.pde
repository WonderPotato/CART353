/*
*    Image Processing
 *
 *    Remix Assignment 
 *
 *    Cart 353 - winter 2018
 *
 *    Michelle Samson - 27037600
 *
 *    Professor Rilla Khaled
 *
 *
 */

//declare two new objects from the Remix class
Remix image1;
Remix image2;


//inspiration for different screen access by https://www.toptal.com/game/ultimate-guide-to-processing-simple-game

//0: home screen
//1: instruction screen 
//2: remixOne Screen 
//3: remixTwo Screen
//4: remixThree Screen

// variable to control which screen the user is on 
int remixScreen = 0;


void setup() {

  size(1000, 1000);
  background(0);

  //instantiate the existence of the image objects and their position to be further manipulated
  image1 = new Remix(loadImage("image1.jpg"));
  image2 = new Remix(loadImage("image2.jpg"));
}



void draw() { 

  //display stuff of current screen
  if (remixScreen == 0) {
    homeScreen();
  } else if (remixScreen == 1) {
    instructionScreen();
  } else if (remixScreen == 2) {
    remixOneScreen();
  } else if (remixScreen == 3) {
    remixTwoScreen();
  } else if (remixScreen == 4) {
    remixThreeScreen();
  } else if (remixScreen == 5) {
    remixOne();
  } else if (remixScreen == 6) {
    remixTwo();
  } else if (remixScreen == 7) {
    remixThree();
  }
}



//---------screen contents----------//

void homeScreen() {

  //welcome message 
  background(0);
  textAlign(CENTER);
  textSize(32);
  text("Welcome to the Image Processing Remix Platform! \n Click to continue", height/2, width/2);
}

void instructionScreen() {

  //instruction for the program
  //instruction for each function of interactive image processing
  background(255);
  textAlign(CENTER);
  textSize(36);
  fill(0);
  text("This Platform has 3 interactive features that let's you manipulate two images to create a new image!", width/4, 40, 500, 500);

  textAlign(CENTER);
  textSize(24);
  fill(0);
  text("Press b for Remix 1 : Blend two images for a Screen results!", width/4, height/3, 500, 250);

  textAlign(CENTER);
  textSize(24);
  fill(0);
  text("Press m for Remix 2 : Create a new image by random pointilism from two images!", width/4, height/2, 500, 250);

  textAlign(CENTER);
  textSize(24);
  fill(0);
  text("Press the d key for Remix 3 : Create a difference blend with two images!", width/4, height/1.5, 500, 250);

  textAlign(CENTER);
  textSize(24);
  fill(0);
  text("Press s to save your new image! \n Press r when you want to return to the home page after the image interactions!", width/4, height/1.20, 500, 200);

  if (keyPressed) {

    //press b for Remix # 1
    if (key == 98) {
      remixScreen = 2;
    }

    //press m for Remix # 2
    if (key == 109) {
      remixScreen = 3;
    }

    //press d for Remix # 3
    if (key == 100) {
      remixScreen = 4;
    }

    //press "s" for saving new file
    if (key == 115) {
      save("newRemixedImage.jpg");
    }
  }
}



void remixOneScreen() {

  //intro screen for remix #1
  //message #1
  background(0);
  textSize(50);
  fill(255);
  textAlign(TOP);
  text("Screen Time!", width/3, 100);
  textAlign(CENTER);
  textSize(32);
  text("Press the Spacebar to start!", width/4, height/4, 500, 1000);

  if (keyPressed) {
    if (key == 32) {

      remixScreen = 5;
      remixOne();
    }
  }
}


void remixTwoScreen() {
  //intro screen for remix #2 
  //message #2
  background(0);
  textSize(50);
  fill(255);
  textAlign(TOP);
  text("Pointilism Time!", width/3, 100);
  textAlign(CENTER);
  textSize(32);
  text("This function takes pixels from each image and illustrates them randomly accross the screen!", width/4, height/4, 500, 1000);
  text("Press the Spacebar to start!", width/2, 900); 

  if (keyPressed) {
    if (key == 32) {
      remixScreen = 6;
      remixTwo();
    }
  }
}


void remixThreeScreen() {

  //message #3
  background(0);
  textSize(50);
  fill(255);
  textAlign(CENTER);
  text("It makes all the Difference!", width/2, 100);
  textAlign(CENTER);
  textSize(32);
  text("Press the Spacebar to start!", width/4, height/4, 500, 1000);
  if (keyPressed) {
    if (key == 32) {
      remixScreen= 7;
      remixThree();
    }
  }
}



void remixOne() {

  background(0);

  image1.xKeyBlend(loadImage("image1.jpg"), loadImage("image2.jpg"));

  if (keyPressed) {
    if (key == 115) {
      saveFrame("newBlendImage.jpg");
    } //press r to return to home screem
    if (key == 114) {
      remixScreen = 0;
      homeScreen();
    }
  }
}

void remixTwo() {
  background(0); 
  image1.pointyTwo(loadImage("image1.jpg"), loadImage("image2.jpg"), 0, 0, 500, 0);
  image2.pointyTwo(loadImage("image1.jpg"), loadImage("image2.jpg"), 0, 0, 500, 0);

  if (keyPressed) {
    if (key == 115) {
      save("newPointyImage.jpg");
    }
    //press r to return to home screem
    if (key == 114) {
      remixScreen = 0;
      homeScreen();
    }
  }
}


void remixThree() {
  background(0); 
  image1.cKeyBlend(loadImage("image1.jpg"), loadImage("image2.jpg"));

  //press s to save
  if (keyPressed) {
    if (key == 115) {
      save("newDifferenceImage.jpg");
    }
    //press r to return to home screem
    if (key == 114) {
      remixScreen = 0;
      homeScreen();
    }
  }
}


//main inputs
public void mousePressed() {
  //if on the home screen when clicked, bring user to instruction screen
  if (remixScreen == 0) {
    instructionPage();
  }
}

//other functions for the main structure
//to access the instruction page
void instructionPage() {
  remixScreen = 1;
}