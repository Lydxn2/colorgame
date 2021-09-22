void mousePressed() {
  switch (mode) {
  case MODE_START:
    mode = MODE_PLAY;
    initRound();
    speed = 5;
    score = 0;
    break;
  case MODE_PLAY:
    if ((isTouching(true) && isMatch) || (isTouching(false) && !isMatch))
      nextRound();
    else
      mode = MODE_GAMEOVER;
    break;
  case MODE_GAMEOVER:
    mode = MODE_START;
    break;
  }
}

void keyPressed() {
  if (key == 't' || key == 'T') keyT = true;
  if (key == 'f' || key == 'F') keyF = true;
  if (key == 'x' || key == 'X') keyX = true;
}

void keyReleased() {
  switch (mode) {
  case MODE_START:
    if (keyX) {
      impossible = true;
      mode = MODE_PLAY;
      initRound();
      speed = 10;
      score = 0;
    }
    break;
  case MODE_PLAY:
    if (keyT || keyF) {
      if ((keyT && isMatch) || (keyF && !isMatch))
        nextRound();
      else
        mode = MODE_GAMEOVER;
    }
    break;
  }
  
  if (key == 't' || key == 'T') keyT = false;
  if (key == 'f' || key == 'F') keyF = false;
  if (key == 'x' || key == 'X') keyX = false;
}
