void doStart() {
  drawBG();
  
  textAlign(CENTER, CENTER);
  if (inTitle(mouseX, mouseY)) {
    fill(0, 255, 0);
    textFont(roboFontB, 30);
    text("click to start!", width / 2, height / 2 + 100);
    fill(255, 0, 0);
    textFont(roboFontB, 10);
    text("Press X for IMPOSSIBLE Mode'", width / 2, height / 2 + 130);
    fill(50);
  } else {
    fill(255);
  }
  textFont(roboFont, 100);
  text("colorgame.", width / 2, height / 2 - 10);
}

boolean inTitle(int x, int y) {
  return TITLE_X <= x && x <= TITLE_X2 && TITLE_Y <= y && y <= TITLE_Y2;
}
