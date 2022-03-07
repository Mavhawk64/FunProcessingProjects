class Ball {
  PVector pos,vel,acc;
  float r;
  public Ball() {
    this(new PVector(width/2, height/2));
  }
  
  public Ball(float r) {
    this();
    this.r = r;
  }

  public Ball(PVector pos) {
    this(pos, new PVector(0,0));
  }
  
  public Ball(PVector pos, float r) {
    this(pos);
    this.r = r;
  }

  public Ball(PVector pos, PVector vel) {
    this(pos,vel,new PVector(0,1));
  }
  
  public Ball(PVector pos, PVector vel, float r) {
   this(pos,vel);
    this.r = r;
  }

  public Ball(PVector pos, PVector vel, PVector acc) {
    this.pos = pos;
    this.vel = vel;
    this.acc = acc;
  }
  
  public Ball(PVector pos, PVector vel, PVector acc, float r) {
    this(pos,vel,acc);
    this.r = r;
  }
  
  void update() {
    this.pos.add(this.vel);
    this.vel.add(this.acc);
    this.bounce(0.9);
  }
  
  void bounce(float f) {
    if(this.pos.x + 2*this.r >= width || this.pos.x - 2*this.r <= 0) {
      this.vel.x = -f*this.vel.x;
    }
    if(this.pos.y - 2*this.r <= 0 || this.pos.y + 2*this.r >= height) {
      this.vel.y = -f*this.vel.y;
    }
    this.pos.add(this.vel);
    this.vel.add(this.acc);
    //this.update();
  }
  
  PVector setForce(PVector acc) {
    this.acc = acc;
    return this.acc;
  }
  
  PVector setVelocity(PVector vel) {
    this.vel = vel;
    return this.vel;
  }
  
  void show() {
    try {
    circle(this.pos.x,this.pos.y,this.r);
    } catch(Exception e) {
      this.r = 10;
      this.show();
    }
  }
  
}
