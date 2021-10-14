class Particle extends GameObject {
  color col;
  int sides;
  Particle(float x, float y, int sides) {
    this.loc = new PVector(x, y);
    this.vel = new PVector(0, 5);
    this.sides = sides;
    this.rad = 3;
    this.lives = 255;
    this.col = WHITE;
    
    vel.rotate(radians(random(0, 360)));
    vel.setMag(random(1, 5));
  }
  
  void render() {
    noStroke();
    stroke(col, this.lives); strokeWeight(1); noFill();
    polygon(this.loc, this.rad, this.sides, random(0, 360));
  }
  
  void act() {
    super.act();
    this.lives -= 10;
    if (this.lives <= 0) this.lives = 0;
  }
}
