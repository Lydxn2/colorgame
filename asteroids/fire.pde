class Fire extends GameObject {
  color col;
  Fire() {
    this.loc = ship.loc.copy();
    this.vel = ship.dir.copy();
    this.rad = 5;
    this.lives = 255;
    this.col = #52ff86;

    vel.rotate(radians(random(160, 200)));
    vel.setMag(5);
  }
  
  void render() {
    noStroke();
    stroke(col, this.lives); strokeWeight(2); noFill();
    polygon(this.loc, this.rad, (int) random(3, 8), random(0, 360));
  }
  
  void act() {
    super.act();
    this.lives -= 5;
    if (this.lives <= 0) this.lives = 0;
  }
}
