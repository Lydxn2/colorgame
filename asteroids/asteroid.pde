class Asteroid extends GameObject {
  int sides;
  float speed, ang, spin;
  
  Asteroid() {
    this(
      -1,                 // starting x-position
      -1,                 // starting y-position
      70,                 // size of the asteorid
      random(0.5, 1),     // speed of the asteroid
      random(0, 360),     // starting rotation of the asteroid
      random(-1, 1),      // spin speed of the asteroid
      (int) random(3, 8), // # of sides of the asteroid
      3                   // # of "splits" before the asteroid dies
    );
    
    do {
      this.loc = new PVector(random(0, width), random(0, height));
    } while (this.loc.dist(ship.loc) < 150);
  }
  
  Asteroid(Asteroid a) {
    this(a.loc.x, a.loc.y, a.rad, a.speed, a.ang, a.spin, a.sides, a.lives);
  }
  
  Asteroid(float x, float y, float rad, float speed, float ang, float spin, int sides, int lives) {
    this.loc = new PVector(x, y);
    this.vel = new PVector(0, speed);
    this.vel.rotate(random(0, TAU));
    this.rad = rad;
    this.speed = speed;
    this.ang = ang;
    this.spin = spin;
    this.sides = sides;
    this.lives = lives;
  }
  
  void render() {
    noFill(); stroke(WHITE); strokeWeight(5);
    polygon(this.loc, this.rad, this.sides, this.ang);
  }
  
  void act() {
    super.act();
    this.ang += this.spin;
  }
}
