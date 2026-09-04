import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing b2d ;

ArrayList<Bound> bound ;
ArrayList<Cs> poly ;

void setup() {
  size(1000, 1000);
  b2d = new Box2DProcessing(this);
  b2d.createWorld();
  b2d.setGravity(0, -20);

  poly = new ArrayList<Cs>();
  bound = new ArrayList<Bound>();

  bound.add(new Bound(width/4, height-5, width/2-50, 10, 0));
  bound.add(new Bound(3*width/4, height-250, width/2-50, 10, 0));
  bound.add(new Bound(width-5, height/2, 10, height, 0));
  bound.add(new Bound(5, height/2, 10, height, 0));
}

void draw() {
  background(255);
  b2d.step();
  for (Bound wall : bound) {
    wall.show();
  }

  for (Cs cs : poly) {
    cs.show();
  }

  for (int i = poly.size()-1; i >= 0; i--) {
    Cs cs = poly.get(i);
    if (cs.done()) {
      poly.remove(i);
    }
  }
}

void mouseDragged() {
  Cs cs = new Cs(mouseX, mouseY);
  poly.add(cs);
}