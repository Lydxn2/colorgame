class UFO extends GameObject {
  UFO() {
    int side = (int) random(0, 2);
    if (side == 0)
      this.loc = new PVector(50, -100);
    if (side == 1)
      this.loc = new PVector(height - 50, height + 100);
  }
  
  void render() {
    
  }
}
