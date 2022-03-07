int x = 0;
int y = 0;
void setup() {
  //size(500,500);
  //size(1000,500);
  fullScreen();
  colorMode(HSB);
}

void draw() {
  loadPixels();
  for(x = 0; x < height; x++) {
    for(y = 0; y < width; y++) {
      float dx = map(x,0,height,0,255);
      float dy = map(y,0,width,0,255);
      color c = color(dy,255,255-dx);
      pixels[width * x + y] = c;
    }
  }
  updatePixels();
  saveFrame("colors.png");
  noLoop();
}
