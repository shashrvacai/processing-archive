import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing b2d ;

ArrayList<Bound> bs ;
ArrayList<LL> l ;

void setup(){
  size(700,700);
  b2d = new Box2DProcessing(this,20);
  b2d.createWorld();
  b2d.setGravity(0,-20);
  
  l = new ArrayList<LL>();
  bs = new ArrayList<Bound>();
  
  bs.add(new Bound(width/4,height-5,width/2-50,10,0));
  bs.add(new Bound(3*width/4,height-50,width/2-50,10,0));
  bs.add(new Bound(width-5,height/2,10,height,0));
  bs.add(new Bound(5,height/2,10,height,0));
}
void draw(){
  background(255);
  
  
  b2d.step();
  
  for(Bound wall : bs ){
    wall.show();
  }
  
  for(LL p : l){
    p.show();
  }
  
  for(int i = l.size()-1 ; i >=0 ; i--){
    LL ls = l.get(i);
    if(ls.done()){
      l.remove(i);
    }
  }  

}

void mouseDragged(){
  LL p = new LL(mouseX, mouseY);
  l.add(p);
}