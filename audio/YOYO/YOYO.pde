import processing.sound.*;

Amplitude amp ;
AudioIn in ;

ArrayList<veh> vs;

float  a = 0;

void setup(){
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
  
  size(1000,1000);
  background(255);
  vs = new ArrayList<veh>();
  for(int i = 0 ; i < 450 ; i++){
    vs.add(new veh(random(width),random(height)));
  }
}

void draw(){
  float aa = amp.analyze();
  
  float trail = map(aa,0.5,1,50,0);
  fill(255,trail);
  noStroke();
  rectMode(LEFT);
  rect(0,0,width,height);
  noFill();
    
    float x = (sin(a/2)* width) +width/2 ;
    float y = (cos(a/8)* width) +height/2 ;
    
    stroke(255,0,0);
    //ellipse(x,y,10,10);
    
    float xu = (sin(a/4)* width/4) +width/2 ;
    float yu = (cos(a/2)* width/4) +height/2 ;
    
    int t = floor(map(aa , 0,0.2 ,0,10));
    for(int i = 0 ; i < t ; i++){
      vs.add(new veh(random(xu-20,xu+20),random(yu-20,yu+20)));
    }
    
    
    //if(aa > 0.01 ){
    //vs.add(new veh(random(xu-20,xu+20),random(yu-20,yu+20)));
    //}
  for (int i = vs.size()-1; i >= 0; i--) {
      veh p = vs.get(i);
      p.update();
      if (p.isDead()) {
        vs.remove(i);
      }
    }
  
  for(veh v :vs){
    v.aB(vs, x,y);
    v.update();
    v.show();
    v.edges();
    
  }
  a+= (aa*3) ;
}

void mouseDragged(){
  vs.add(new veh(mouseX, mouseY));
}