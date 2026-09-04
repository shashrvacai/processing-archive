
import oscP5.*;
OscP5 oscP5;
int a =  200;
float b =200 ;
 
 
void setup(){
oscP5 = new OscP5(this,12000);
size(600,600);
oscP5.plug(this,"result","/test");
background(0);

}
 
void draw() {
  noFill();
  stroke(255);
  //ellipse(width/2,height/2,a,b);

}
 
// The function must be public 
public void result(int valueA, float valueB, String valueS) {
  println("The three result will be: " + valueA + ", " + valueB +" ," + valueS);
  
   valueA = a;
   valueB = b ;
   
  
  
}
