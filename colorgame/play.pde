void doPlay() {
  background(255);
  
  noStroke();
  // display green border
  if (isTouching(true)) {
    fill(0, 255, 0);
    rect(0, 100, width / 2, height - 100);
    fill(200, 255, 200);
    rect(10, 110, width / 2 - 20, height - 120);
  } else {
    fill(255);
    rect(0, 100, width / 2, height);
  }
  
  // display red border
  if (isTouching(false)) {
    fill(255, 0, 0);
    rect(width / 2, 100, width / 2, height - 100);
    fill(50, 0, 0);
    rect(width / 2 + 10, 110, width / 2 - 20, height - 120);
  } else {
    fill(0);
    rect(width / 2, 100, width / 2, height - 100);
  }

  textAlign(CENTER, CENTER);
  textFont(roboFontB, 150);
  fill(0);
  text("T", width / 4, height / 2 + 50);
  fill(255);
  text("F", 3 * width / 4, height / 2 + 50);
  
  // draw checkerboard
  int checkerSize = 20;
  for (int x = 0; x < width; x += checkerSize) {
    for (int y = 0; y < 100; y += checkerSize) {
      fill((x + y) / checkerSize % 2 > 0 ? 0 : 255, 50);
      rect(x, y, checkerSize, checkerSize);
    }
  }
  
  // actual game logic
  fill(colors[fontColor]);
  textAlign(LEFT, CENTER);
  textFont(roboFontB, 80);
  
  if (impossible)
    text(new String(reverse(colorNames[textColor].toCharArray())), colorX, 35);
  else
    text(colorNames[textColor], colorX, 35);

  // snooze, you lose
  colorX += speed;
  if (colorX > width)
    mode = MODE_GAMEOVER;
  
  // display score
  fill(0);
  textAlign(CENTER, CENTER);
  textFont(roboFont, 80);
  text(score, width / 2, 35);
}

void initRound() {
  isMatch = random(0, 1) > .5;
  colorX = -250;
  textColor = (int) random(0, 6);
  fontColor = isMatch ? textColor : (textColor + (int) random(1, 6)) % 6;
}

void nextRound() {
  // every five rounds, increase the text scroll speed
  if (++score % 5 == 0)
    speed += 2;
  initRound();
}

boolean isTouching(boolean b) {
  if (b)
    return mouseX <= width / 2 && mouseY >= 100;
  else
    return mouseX > width / 2 && mouseY >= 100;
}
