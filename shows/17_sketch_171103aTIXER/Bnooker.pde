class Snooker {
  float aVel = 0.0 ;    //  initial velocity
  float aAcc = 0.001 ;
  float r = 300;       // raduis from the center  
  float a = 0.0 ;      //angle
  float d = 20 ;
  color top = color(100, 304, 200);        // color 1
  color bottom =  color(200, 177, 5);      // color 2



  Snooker() {
  }

  void run() {
translate(width/2, height/2);
    fill(0, 25);
    rect(0, 0, width, height);
    noFill();

    
    scale(2);
    rotate(PI/2);



    float  u = 10 ; // multiply factor for  amp
    float Am = amp.analyze()*u;     //


    // ------ adds forward and reverse acceleation 
    if (Am > u) {
      aAcc *= -1.5;
    } else {
      aAcc *=  1;
    }

    float x = r *sin(a);     
    float y = r *cos(a);

    float C = map(x, 0, height, 0, 1);
    color c = lerpColor(top, bottom, C);
    fill(c);
    noStroke();

    // ------ number of circles , with exponential increase in the dist
    for (int i =1; i <= 4; i ++) {
      ellipse(x*Am, y*i, d, d);
      ellipse(-x*Am, -y*i, d, d);
      x = x*Am;    // bring it closer to the center by mult by Am(0-1)
      y = y*Am;
    }


    /// bloody fucking physics engine .
    a += aVel;
    aVel += aAcc;
    aVel =constrain(aVel, 0, 0.2);
  }
}