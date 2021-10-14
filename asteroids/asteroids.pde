// Lyndon Ho
// why...

import java.util.ArrayDeque;
import java.util.Deque;

enum Mode {
  INTRO, GAME, GAMEOVER;
}
Mode mode;

final color BLACK = #000000;
final color WHITE = #FFFFFF;

PFont deltaFont, deltaBFont, ubuntuMonoFon;
AnimatedText titleText, toGameText, youLoseText, youWinText, toStartText;

GIF[] heartGif;
GIF ufoImg;

boolean keyLeft, keyRight, keyUp, keySpace, keyEnter, keyT;
boolean freeSpace, freeEnter;

Ship ship;
UFO ufo;
ArrayList<Bullet> bullets;
ArrayList<Asteroid> asteroids;
ArrayList<Particle> particles;

boolean win;
int tCooldown;

void setup() {
  size(800, 600, FX2D);
  
  deltaFont = createFont("data/fonts/deltav2/deltav2.ttf", 1);
  deltaBFont = createFont("data/fonts/deltav2/deltav2b.ttf", 1);
  
  heartGif = new GIF[3];
  for (int i = 0; i < 3; i++)
    heartGif[i] = new GIF("data/images/heart", ".png", 2, 5);
  ufoImg = new GIF("data/images/ufo", ".png", 1, 1);
  
  rectMode(CENTER);
  
  resetGame();
  mode = Mode.INTRO;
}

void draw() {
  switch (mode) {
    case INTRO:
      doIntro();
      break;
    case GAME:
      doGame();
      break;
    case GAMEOVER:
      doGameOver();
      break;
  }
}

void resetGame() {
  titleText = new FloatingText("Asteroids", deltaBFont, width / 2, height / 2, 100, WHITE);
  toGameText = new FloatingText("[ press ENTER to start ]", deltaFont, width / 2, height * 2 / 3, 20, WHITE);
  toStartText = new FloatingText("[ press ENTER to restart ]", deltaFont, width / 2, height * 2 / 3, 20, WHITE);
  youLoseText = new FloatingText("You LOSE!", deltaBFont, width / 2, height / 2, 100, #FF0000);
  youWinText = new FloatingText("You WIN!", deltaBFont, width / 2, height / 2, 100, #00FF00);

  ship = new Ship(width / 2, height / 2);
  ship.lives = 3;
  
  ufo = null;
  bullets = new ArrayList<Bullet>();
  particles = new ArrayList<Particle>();

  // gimme asteorids!!!
  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < 10; i++)
    asteroids.add(new Asteroid());

  tCooldown = 0;
  win = false;
}

// Yet another processing "feature". Check line 1 in `action.pde`.
boolean wtf = 
