int i = 0;
void setup() {
  size(250,250);
  colorMode(HSB);
}

void draw() {
  background(i++,255,255);
  i %= 255;
}
