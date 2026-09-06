function Walker(){
  var x=width/2;
  var y= height/2;
  var S = 16 // speed of the sphere
  var R = 140; // size of the constraint
  var r = 8 ; // raiud of the spheres
  
  this.render = function(){
    noStroke();
    fill(124,204,241,25);
    ellipse(x,y,r,r);
    
  }
  this.step = function(){
    var choice= floor(random(0,4));
    
    if(choice ===0) {
         x+=S;
         y+=S;
       } else if (choice ===1 ){
         x-=S;
         y+=S;
       } else if (choice ===2 ){
         y-=S;
         x-=S;
       } else if (choice ===3 ){
         y-=S;
         x+=S;
       }
      
      x =constrain(x,width/2-R,width/2+R);
      y =constrain(y,height/2-R,height/2+R);
  }
  
}