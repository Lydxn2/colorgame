class Bullet extends GameObject {
  int lifespan;
  
  Bullet() {
    this.loc = new PVector(ship.loc.x, ship.loc.y);
    this.vel = new PVector(ship.dir.x, ship.dir.y);
    this.vel.setMag(15);
    this.rad = 3;
    this.lives = 1;
    
    // die after some number of frames
    this.lifespan = 20;
  }
  
  void render() {
    noStroke(); fill(WHITE);
    circle(this.loc.x, this.loc.y, rad);
  }
  
  void act() {
    super.act();
    this.loc = this.loc.add(this.vel);
    this.lifespan--;
  }
}
