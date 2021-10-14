void doGame() {
  background(BLACK);
  
  // teleport button
  fill(BLACK);
  stroke(#6BB3B3); strokeWeight(5);
  square(width * 0.05, height * 0.93, 60);
  fill(#6BB3B3);
  textFont(deltaBFont, 40);
  text("T", width * 0.05, height * 0.93);
  fill(#FF0000, 120); noStroke();
  square(width * 0.05, height * 0.93, tCooldown / 10);

  // teleport logic
  if (keyT && tCooldown == 0) {
    ship.teleport();
    tCooldown = 600; // 10 seconds
  }
  if (tCooldown > 0)
    tCooldown--;
    
  // remove old bullets
  for (Bullet b : bullets)
    if (b.lifespan == 0)
      b.lives = 0;

  // shoot bullets
  if (keySpace && freeSpace) {
    bullets.add(new Bullet());
    freeSpace = false;
  }
  // ship-asteroid collision
  if (ship.invincibility == 0) {
    for (Asteroid a : asteroids) {
      if (dist(a.loc.x, a.loc.y, ship.loc.x, ship.loc.y) < a.rad + ship.rad) {
        // remove one life, and make invicible for 120 frames
        ship.lives--;
        ship.invincibility = 255;
        break;
      }
    }
  } else {
    if ((ship.invincibility -= 2) < 0)
      ship.invincibility = 0;
  }
    
  // asteroid-bullet collision
  for (Bullet b : bullets) {
    for (Asteroid a : asteroids) {
      if (dist(a.loc.x, a.loc.y, b.loc.x, b.loc.y) < a.rad) {
        for (int _ = 0; _ < 2; _++) {
          Asteroid newA = new Asteroid(a);
          newA.rad /= 2;
          newA.speed *= 2;
          newA.ang = random(0, 360);
          newA.spin = random(-1, 1);
          newA.lives--;
          asteroids.add(newA);
        }
        a.lives = b.lives = 0;
        break;
      }
    }
  }
  
  // kill code
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    if (a.lives == 0) {
      asteroids.remove(i);
      for (int _ = 0; _ < 50; _++) {
        float xOff = random(-a.rad / 2, a.rad / 2);
        float yOff = random(-a.rad / 2, a.rad / 2);
        particles.add(new Particle(a.loc.x + xOff, a.loc.y + yOff, a.sides));
      }
    }
  }
  for (int i = bullets.size() - 1; i >= 0; i--)
    if (bullets.get(i).lives == 0)
      bullets.remove(i);
  for (int i = particles.size() - 1; i >= 0; i--)
    if (particles.get(i).lives == 0)
      particles.remove(i);
  
  for (Bullet b : bullets)
    { b.act(); b.render(); }
  for (Particle p : particles)
    { p.act(); p.render(); }
  ship.act(); ship.render();
  for (Asteroid a : asteroids)
    { a.act(); a.render(); }
    
  titleText.animate(); titleText.render(); titleText.fade(0.95);
  toGameText.animate(); toGameText.render(); toGameText.fade(0.95);

  // lives
  for (int i = 0; i < ship.lives; i++) {
    // magic formula, don't ask
    heartGif[i].render(width * (0.82 + 0.05 * i), height * 0.9, 40, 40);
  }
  
  if (asteroids.isEmpty()) {
    win = true;
    mode = Mode.GAMEOVER;
  } else if (ship.lives == 0)
    mode = Mode.GAMEOVER;
}
