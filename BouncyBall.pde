Ball ball;
void setup() {
  size(500,500);
  ball = new Ball(new PVector(width/2,height/4),20);
  ball.setForce(new PVector(0,0.1));
  ball.setVelocity(new PVector(random(-1,1),random(-1,1)));
}

void draw() {
  background(0);
  fill(255);
  ball.update();
  ball.show();
}
