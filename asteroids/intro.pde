void doIntro() {
  background(BLACK);
  
  ufoImg.render(200, 200, 340, 200);
  
  ship.act(); ship.render();
  titleText.animate(); titleText.render();
  toGameText.animate(); toGameText.render();

  if (keyEnter && freeEnter) {
    freeEnter = false;
    mode = Mode.GAME;
  }
}
