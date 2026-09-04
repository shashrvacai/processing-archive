import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d ;

ArrayList<Par> ps;
Surface s ;

void setup(){
  size(600,600);
  background(255);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  ps = new ArrayList<Par>();
  s = new Surface();
}

void draw(){
  fill(255,10);
  noStroke();
  rect(0,0,width,height);
  noFill();
  
  if(mousePressed){
    float sz = random(4, 40);
    ps.add(new Par(mouseX,mouseY,sz));
  }  
  
  box2d.step();
  
  
  
  s.show();
  
  for (Par p : ps){
    p.show();
  }
  
  for (int i = ps.size()-1;i >= 0; i--){
    Par p = ps.get(i);
    if(p.done()){
      ps.remove(i);
    }
  
  }

}