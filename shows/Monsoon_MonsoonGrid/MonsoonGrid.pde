void setup(){
  size(1386,766);
background(255);

int  rX1 =00, rW1=250,
     rX2 = rX1+rW1,  rW2 =300,
     rX3 = rX2+rW2, rW3=300 ,
     rX4 = rX3+rW3 ,rW4 =250,
     rX5 = rX4+rW4, rW5 = 300 ; 
      
int bX1 = 0 , bW1 = 300 ,
    bX2 = bX1+bW1 , bW2 =200 ,
    bX3 = bX2+bW2 , bW3 = 300 ,
    bX4 = bX3+bW3 , bW4 = 300 ,
    bX5 = bX4+bW4 , bW5 = 285; 

R5(rX5,rW5,bX5,bW5);
R5(rX4,rW4,bX4,bW4);
R5(rX3,rW3,bX3,bW3);
R5(rX2,rW2,bX2,bW2);
R5(rX1,rW1,bX1,bW1);


}
