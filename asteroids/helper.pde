class GIF {
  PImage[] images;
  int frames, refresh;
  int gameFrame, imgFrame;
  GIF(String path, String ext, int frames, int refresh) {
    this.images = new PImage[frames];
    this.frames = frames;
    this.refresh = refresh;
    this.gameFrame = this.imgFrame = 0;
    
    for (int i = 0; i < frames; i++)
      this.images[i] = loadImage(path + nf(i, 4) + ext);
  }
  
  void render(float x, float y, float w, float h) {
    this.gameFrame = (this.gameFrame + 1) % this.refresh;
    if (this.gameFrame == 0)
      this.imgFrame = (this.imgFrame + 1) % this.frames;
    image(this.images[this.imgFrame], x, y, w, h);
  }
}

abstract class AnimatedText {
  String text;
  PFont font;
  float origX, origY;
  float x, y, sz, fade;
  color col;
  
  AnimatedText(String text, PFont font, float x, float y, int sz, color col) {
    this.text = text;
    this.font = font;
    this.x = this.origX = x;
    this.y = this.origY = y;
    this.sz = sz;
    this.col = col;
    this.fade = 1;
  }
  
  abstract void animate();
  
  void render() {
    fill(this.col, 255 * this.fade);
    textAlign(CENTER, CENTER);
    textFont(this.font, this.sz);
    text(this.text, this.x, this.y);
  }
  
  void fade(float mult) {
    this.fade *= mult;
    if (this.fade < 0)
      this.fade = 0;
  }
}

class FloatingText extends AnimatedText {
  class Trail {
    float x, y;
    int alpha;
    
    Trail(float x, float y, int alpha) {
      this.x = x;
      this.y = y;
      this.alpha = alpha;
    }
  };
  
  float theta;
  Deque<Trail> trails;
  int trailFrame;

  FloatingText(String text, PFont font, float x, float y, int sz, color col) {
    super(text, font, x, y, sz, col);
    this.theta = 0;
    
    this.trails = new ArrayDeque<Trail>();
    this.trailFrame = 0;
  }
  
  void animate() {
    this.theta = (this.theta + 2) % 360;
    this.y = this.origY + sin(radians(theta)) * 20;
  }
  
  void render() {
    for (Trail t : this.trails) {
      fill(this.col, (t.alpha -= 2) * this.fade);
      textAlign(CENTER, CENTER);
      textFont(this.font, this.sz);
      text(this.text, t.x, t.y);
    }
    super.render();
    
    if (this.trails.size() == 20)
      this.trails.removeFirst();
    if (this.trailFrame++ % 2 == 0)
      this.trails.addLast(new Trail(this.x, this.y, 50));
  }
}

// draw a polygon
void polygon(PVector p, float rad, int sides, float startAng) {
  beginShape();
  for (int i = 0; i <= sides; i++) {
    float ang = radians(360 / sides * i + startAng);
    vertex(p.x + cos(ang) * rad, p.y + sin(ang) * rad);
  }
  endShape();
}
