FF f ;
ArrayList<Veh> v ;
boolean debug = false ;

void setup(){
  size(700,700);
  background(255);
  f = new FF(40);
  v = new ArrayList<Veh>();
  for (int i = 0 ; i < 120 ; i++){
    v.add(new Veh(new PVector(random(width), random(height)), random(2, 5), random(0.1, 0.5)));
  }
}

void draw(){
  pushMatrix();
  translate(width/2, height/2);
  fill(255,10);
  rect(0,0,width-100,height-100);
  popMatrix();
  if(debug) f.show();
  for(Veh veh : v){
    veh.follow(f);
    veh.run();    
  }
}

void keyPressed(){
  debug = !debug ;  
}

void mousePressed(){
  f.init();
}
