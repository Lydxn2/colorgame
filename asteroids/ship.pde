class Ship extends GameObject {
  PVector dir;
  ArrayList<Fire> fire;
  int invincibility;
  
  Ship(float x, float y) {
    this.loc = new PVector(x, y);
    this.vel = new PVector(0, 0);
    this.dir = new PVector(0, -0.2);
    this.lives = 3;
    this.rad = 15;
    
    this.fire = new ArrayList<Fire>();
    this.invincibility = 0;
  }
  
  void render() {
    if (this.invincibility != 0) {
      fill(#CCE0FF, this.invincibility);
      stroke(invincibility); strokeWeight(5);
      circle(this.loc.x, this.loc.y, ship.rad * 6);
    }
    
    for (int i = fire.size() - 1; i >= 0; i--)
      if (fire.get(i).lives == 0)
        fire.remove(i);
    for (Fire f : fire)
      { f.act(); f.render(); }
      
    pushMatrix();
    translate(this.loc.x, this.loc.y);
    rotate(this.dir.heading());
    fill(BLACK); strokeWeight(3); stroke(#36FF5A);
    triangle(-this.rad, -this.rad * .7, -this.rad, this.rad * .7, this.rad, 0);
    popMatrix();
    
    noStroke();
    fill(255, 0, 0);
  }
  
  void act() {
    super.act();
    
    // move ship
    if (keyLeft)
      this.dir.rotate(-radians(5));
    if (keyRight)
      this.dir.rotate(radians(5));
    if (keyUp) {
      this.vel.add(this.dir);
      for (int _ = 0; _ < 3; _++)
        fire.add(new Fire());
    }
      
    // add friction
    this.vel.mult(0.985);
  }
  
  void teleport() {
    while (true) {
      this.loc.x = random(this.rad, width - this.rad);
      this.loc.y = random(this.rad, height - this.rad);
      
      boolean good = true;
      for (Asteroid a : asteroids)
        if (dist(this.loc.x, this.loc.y, a.loc.x, a.loc.y) < 100)
          { good = false; break; }
      if (good)
        break;
    }
    this.vel.x = this.vel.y = 0;
  }
}
