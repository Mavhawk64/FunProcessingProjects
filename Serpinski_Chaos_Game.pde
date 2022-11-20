ArrayList<ArrayList<PVector>> a;
ArrayList<PVector> r;
int points = 3;
int ticks = 1000;
int rec = 7;
void setup() {
  //size(700, 700);
  fullScreen();
  background(0);
  a = new ArrayList<ArrayList<PVector>>();
  float rw = random(width);
  float rh = random(height);
  r = new ArrayList<PVector>();
  for (int i = 0; i < rec; i++) {
    a.add(new ArrayList<PVector>());

    r.add(new PVector(rw, rh));
  }
  strokeWeight(0.5);
  stroke(255, 255, 255, 200);
  point(rw, rh);

  //Hard code:
  //a.get(0).add(new PVector(width/2, 0));
  //a.get(0).add(new PVector(0, height));
  //a.get(0).add(new PVector(width, height));

  //a.get(1).add(new PVector(width/2, height));
  //a.get(1).add(new PVector(width*3/4, height/2));
  //a.get(1).add(new PVector(width/4, height/2));

  //a.get(2).add(new PVector(width/2, height/2));
  //a.get(2).add(new PVector(width*3/8, height*3/4));
  //a.get(2).add(new PVector(width*5/8, height*3/4));

  //a.get(3).add(new PVector(width/2, height*6/8));
  //a.get(3).add(new PVector(width*9/16, height*5/8));
  //a.get(3).add(new PVector(width*7/16, height*5/8));
  float hp = 0;
  float hc = height;
  float wl = 0;
  float wr = width;
  for (int i = 0; i < rec; i++) {
    if (i % 2 == 0) {
      a.get(i).add(new PVector(width/2, hp));
      a.get(i).add(new PVector(wl, hc));
      a.get(i).add(new PVector(wr, hc));
    } else {
      a.get(i).add(new PVector(width/2, hp));
      a.get(i).add(new PVector(wr, hc));
      a.get(i).add(new PVector(wl, hc));
    }
    
    int n = i + 1;
    wl = (float)(Math.pow(2, n+1) - Math.pow(2,n) - 1) * width / (float)Math.pow(2,n+1);
    wr = (float)(Math.pow(2, n+1) - Math.pow(2,n) + 1) * width / (float)Math.pow(2,n+1);
    
    float temp = hp;
    hp = hc;
    hc = (temp + hc) / 2;
  }

  //float w = 1.0/2 + 1.0/16;
  //w*=width;
  //float h = 5.0/8;
  //h*=height;
  //circle(w, h, 10);
}

void draw() {
  for (int j = 0; j < a.size(); j++) {
    for (int i = 0; i < ticks; i++) {
      int d = floor(random(points));
      r.set(j, PVector.lerp(r.get(j), a.get(j).get(d), 0.5));
      if (points == 3) {
        switch(d) {
        case 0: 
          stroke(255, 0, 255, 200);
          break;
        case 1: 
          stroke(0, 255, 255, 200);
          break;
        case 2: 
          stroke(255, 255, 0, 200);
          break;
        }
      }
      point(r.get(j).x, r.get(j).y);
    }
  }
}
