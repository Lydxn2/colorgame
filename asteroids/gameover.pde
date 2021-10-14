void doGameOver() {
  background(0);

  if (win)
    { youWinText.animate(); youWinText.render(); }
  else
    { youLoseText.animate(); youLoseText.render(); }
  toStartText.animate(); toStartText.render();
  
  if (keyEnter && freeEnter) {
    freeEnter = false;
    resetGame(); mode = Mode.INTRO;
  }
}
