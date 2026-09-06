/*    this is a different way of commenting    */


size(600,600);
background(0);

color top = color(100,304,200);
color bottom =  color(200,177,5);


/*
for (int y =0 ; y < height ; y ++){
  float C = map(y , 0,height,0,1);
  color c = lerpColor(top,bottom,C);
  stroke(c);
  line(0,y,width,y);
}
*/

//
for (int x =0 ; x < width ; x ++){
  float C = map(x , 0,width,0,1);
  color c = lerpColor(top,bottom,C);
  stroke(c);
  line(x,0,x,height);
}