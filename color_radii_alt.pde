PVector r,g,b;
boolean isCMYK = true;
boolean showBall = false;
boolean saveGIF = false;
int gifCount = 0;
float range = 1;
void setup() {
  size(500,500);
  noiseSeed(0);
  //size(1000,500);
  //fullScreen();
  r = new PVector(0,height);
  g = new PVector(width/2,0);
  b = new PVector(width,height);
}

void draw() {
  loadPixels();
  for(int x = 0; x < width; x++) {
    for(int y = 0; y < height; y++) {
      float cr = dist(x,y,r.x,r.y);
      cr = map(cr, 0,max(dist(r.x,r.y,g.x,g.y),dist(r.x,r.y,b.x,b.y)),0,255);
      float cg = dist(x,y,g.x,g.y);
      cg = map(cg, 0,max(dist(r.x,r.y,g.x,g.y),dist(g.x,g.y,b.x,b.y)),0,255);
      float cb = dist(x,y,b.x,b.y);
      cb = map(cb, 0,max(dist(b.x,b.y,g.x,g.y),dist(r.x,r.y,b.x,b.y)),0,255);
      color c = color(255-cr,255-cg,255-cb);
      if(isCMYK)
        c = color(cr,cg,cb);
      pixels[width * y + x] = c;
    }
  }
  updatePixels();
  fill(0,0,0,69);
  noStroke();
  if(showBall) {
  circle(r.x,r.y,10);
  circle(g.x,g.y,10);
  circle(b.x,b.y,10);
  }
  //if(isStatic) {
  //  noLoop();
  //  if(savePic) {
  //  if(isCMYK)
  //    saveFrame("colorsCMYK.png");
  //  else
  //    saveFrame("colorsRGB.png");
  //  }
  //}
  if(saveGIF && frameCount % 5 == 0) {
    saveFrame("gif" + gifCount + ".png");
    gifCount++;
  }
  r.x += random(-range,range);
  r.y += random(-range,range);
  g.x += random(-range,range);
  g.y += random(-range,range);
  b.x += random(-range,range);
  b.y += random(-range,range);
  if(r.x < 0)
    r.x = width;
  if(r.y < 0)
    r.y = height;
  if(r.x > width)
    r.x = 0;
  if(r.y > height)
    r.y = 0;
  if(g.x < 0)
    g.x = width;
  if(g.y < 0)
    g.y = height;
  if(g.x > width)
    g.x = 0;
  if(g.y > height)
    g.y = 0;
  if(b.x < 0)
    b.x = width;
  if(b.y < 0)
    b.y = height;
  if(b.x > width)
    b.x = 0;
  if(b.y > height)
    b.y = 0;
}
