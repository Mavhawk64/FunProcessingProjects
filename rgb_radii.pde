PVector r,g,b;
float rxoff,ryoff,gxoff,gyoff,bxoff,byoff = 0;
float rxamt,gxamt,bxamt,ryamt,gyamt,byamt;
float range = 0.02;
boolean isCMYK = true;
boolean isStatic = true;
boolean savePic = false;
boolean showBall = false;
boolean saveGIF = true;
int gifCount = 0;
void setup() {
  saveGIF &= !isStatic;
  //size(500,500);
  noiseSeed(0);
  //size(1000,500);
  fullScreen();
  r = new PVector(0,height);
  g = new PVector(width/2,0);
  b = new PVector(width,height);
  rxoff = r.x;
  ryoff = r.y;
  gxoff = g.x;
  gyoff = g.y;
  bxoff = b.x;
  byoff = b.y;
  rxamt = random(-range,range);
  gxamt = random(-range,range);
  bxamt = random(-range,range);
  ryamt = random(-range,range);
  gyamt = random(-range,range);
  byamt = random(-range,range);
}

void draw() {
  rxoff += rxamt;
  gxoff += gxamt;
  bxoff += bxamt;
  ryoff += ryamt;
  gyoff += gyamt;
  byoff += byamt;
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
  r.x = noise(rxoff)*width;
  r.y = noise(ryoff)*height;
  g.x = noise(gxoff)*width;
  g.y = noise(gyoff)*height;
  b.x = noise(bxoff)*width;
  b.y = noise(byoff)*height;
  if(isStatic) {
    noLoop();
    if(savePic) {
    if(isCMYK)
      saveFrame("colorsCMYK.png");
    else
      saveFrame("colorsRGB.png");
    }
  }
  if(saveGIF && frameCount % 5 == 0) {
    saveFrame("gif" + gifCount + ".png");
    gifCount++;
  }
}
