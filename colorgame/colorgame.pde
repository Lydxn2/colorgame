// Lyndon Ho
// Sep. 22, 2021
// colorgame.pde

import java.util.*;

// mode constants
final int MODE_START = 0;
final int MODE_PLAY = 1;
final int MODE_GAMEOVER = 2;

// coordinate constants
final int TITLE_X = 105, TITLE_X2 = 680;
final int TITLE_Y = 265, TITLE_Y2 = 365;
final int OVER_X = 220, OVER_X2 = 580;
final int OVER_Y = 250, OVER_Y2 = 360;

// record the current mode
int mode;

// custom fonts
PFont roboFont, roboFontB;

// image variables
PImage[] bgImage;
int frame, bgFrame;

color[] colors = {
  #FF5D5D, // red
  #FFA25D, // orange
  #FFF55D, // yellow
  #91FF5D, // green
  #5DC4FF, // blue
  #B85DFF, // purple
};
String[] colorNames = new String[] {"RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "PURPLE"};

// game variables
int textColor, fontColor;
int colorX, score, highScore;
float speed;
boolean isMatch;

// impossible mode >:)
boolean impossible;

// key variables
boolean keyT, keyF, keyX;

void setup() {
  // the "best" dimensions
  size(800, 600);
  
  // images
  bgImage = new PImage[4];
  for (int i = 0; i < 4; i++)
    bgImage[i] = loadImage("data/bg" + i + ".png");
  bgFrame = 0;
  
  // fonts
  textAlign(CENTER, CENTER);
  roboFont = createFont("data/RobotoMono-Regular.ttf", 128);
  roboFontB = createFont("data/RobotoMono-Bold.ttf", 128);
  
  // keys
  keyT = keyF = keyX = false;
  
  mode = MODE_START;
}

void draw() {
  switch (mode) {
    case MODE_START: doStart(); break;
    case MODE_PLAY: doPlay(); break;
    case MODE_GAMEOVER: doGameOver(); break;
  }
}

void drawBG() {
  image(bgImage[bgFrame], 0, 0, width, height * 2);
  if (frame % 4 == 0)
    bgFrame = (bgFrame + 1) % 4;
  frame++;
}
