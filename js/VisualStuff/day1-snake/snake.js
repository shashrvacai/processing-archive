function Snake(){
  this.x =0 ;
  this.y = 0 ;
  this.xSpeed = 1 ;
  this.ySpeed = 0 ; 
  
  this.dir = function(x,y){
    this.xSpeed= x;
    this.ySpeed= y;
  }
  
  this.update =function(){
    this.x = this.x + this.xSpeed*Sc;
    this.y = this.y + this.ySpeed*Sc;
     this.x = constrain(this.x,0,width-Sc);
     this.y = constrain(this.y,0,height-Sc);
  }
  
  this.eat= function(pos){
    var d = dist(this.x, this.y, pos.x, pos.y);
    if (d<1){
      return true;
    } else {
      return false
    }
  }
  
  this.show= function(){
    fill(255);
    rect(this.x, this.y, Sc,Sc);
  }
}