class Particule
{
  //Declaration des membres classe particules
  float x, y, vx, vy;
  float d;
  color pc;

  //Declaration de la fonction constructeur au variable de stockage x_ et y_ permettant de stocker les varaible x et y
  Particule(float x_, float y_)
  {
    this.x = x_;
    this.y = y_;
    this.vx = random(-0.1, 0.1);
    this.vy = random(-0.1, 0.1);
    this.d = 3;
    this.pc = color(0, random(255), random(255));
  }

  void motion()
  {
    this.x += this.vx;
    this.y += this.vy;
  }

  void checkEdge()
  {
    if (this.x <0 || this.x > width)
    {
      this.vx *= -1;
    }
    if (this.y <0 || this.y > height)
    {
      this.vy *=-1;
    }
  }

  void display()
  {
    //noStroke();
    strokeWeight(1);
    stroke(255);
    noFill();
    //fill(this.pc);
    ellipse(this.x, this.y, this.d * 2, this.d * 2);
  }
}
