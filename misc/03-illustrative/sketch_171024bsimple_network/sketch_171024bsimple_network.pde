ArrayList<Bob> bs ;

void setup(){
  size(600,600);
  background(0);
  bs = new ArrayList<Bob>(); 
}

void draw(){
  fill(50,1);
  
  rect(0,0,width,height);
    noFill();
    
   bs.add(new Bob());
  for (int i  =bs.size()-1 ; i >= 0;i--){
    Bob b = bs.get(i);
     b.update();
       b.show();
       b.checkEdges();
       
       if (b.isDead()){
          bs.remove(i);
       }
  }
  
 fill(0);
  textSize(42);
   textAlign(LEFT);
   text("simple", width/4, height/3-50);
   textSize(62);
  text("Networks", width/4, height/3);
}