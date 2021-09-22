void doGameOver() {
  drawBG();
  
  highScore = max(highScore, score);
  impossible = false;
  
  if (OVER_X <= mouseX && mouseX <= OVER_X2 && OVER_Y <= mouseY && mouseY <= OVER_Y2) {
    fill(0, 255, 0);
    textFont(roboFontB, 30);
    text("click to start!", width / 2, height / 2 + 100);
    fill(50);
  } else {
    fill(255);
  }

  textAlign(CENTER, CENTER);
  textFont(roboFont, 50);
  text("score: " + score, width / 2, height / 2 + 30);
  text("highscore: " + highScore, width / 2, height / 2 - 30);
}
