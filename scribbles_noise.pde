float xoff,yoff = 0.0;
int t = 0;
void setup() {
  size(200,200);
  noiseSeed(0);
  stroke(0, 10);
  strokeWeight(10);
  background(255);
  colorMode(HSB);
}

void draw() {
  xoff = xoff + .01;
  yoff += 0.02;
  float n = noise(xoff) * width;
  float m = noise(yoff) * height;
  stroke(++t % 255,255,255-map(m+n,0,width+height,0,255),10);
  point(n, m);
}
