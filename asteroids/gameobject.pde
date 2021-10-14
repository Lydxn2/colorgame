abstract class GameObject {
  float rad;
  PVector loc, vel;
  int lives;
  
  abstract void render();

  void act() {
    // loop screen
    if (this.loc.x < -this.rad)
      this.loc.x = width + this.rad;
    else if (this.loc.x > width + this.rad)
      this.loc.x = -this.rad;
    if (this.loc.y < -this.rad)
      this.loc.y = height + this.rad;
    else if (this.loc.y > height + this.rad)
      this.loc.y = -this.rad;

    this.loc = this.loc.add(this.vel);
  }
  
  boolean isOffscreen() {
    return this.loc.x < -this.rad || this.loc.x > width || this.loc.y < -this.rad || this.loc.y > height;
  }
}
