Ball[] balls ;
 
 
void setup (){
  size(400,300);
  surface.setResizable(true);
  balls = new Ball[5];
  for ( int i =0; i < balls.length ; i++){
    balls[i]= new Ball();
  }
}

void draw(){
  background(255);
  
  for (Ball b : balls){
    
  PVector f = new PVector(0,0.1);
  b.applyForce(f);
  
  if (mousePressed){
     PVector g = new PVector(0.2,0);
      b.applyForce(g);
  }
  
  b.move();
  b.edges();
  b.display();
 
  }

}