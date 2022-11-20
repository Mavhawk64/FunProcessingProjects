ArrayList<ArrayList<PVector>> a;
ArrayList<PVector> r;
int points = 3;
int ticks = 1000;
int rec = 7;
void setup() {
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
