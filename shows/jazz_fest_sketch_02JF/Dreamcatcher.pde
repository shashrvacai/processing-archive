class DC {

  color top = color(253, 250, 2);        // color 1
  color bottom =  color(253, 0, 161);      // color 2

  final int nb = 200;
  final float weight = 0.2;
  final float friction = .6;
  final float maxRot = PI / 10;
  float[] tabAngles;
  float nroot1 = random(123), nroot2 = random(223);
  float nroot3 = random(123), nroot4 = random(123);
  float nspeed1 = 0.1, nspeed2 = 0;  // random(-.01, .01)
  float nspeed3 =0, nspeed4 = 0;
  float rY = 0, rZ = 0, defaultAngle, gap = 2;


  DC() {
    gap = (gap + weight) * 6;
    tabAngles  = new float[nb];
    for (int i = 0; i < nb; i ++)
    {
      tabAngles[i] = 0;
    }
  }

  void run(float aa_, float x_ , float y_) {
   
    translate(x_, y_);
    
    nroot3 += nspeed3;
    nroot4 += nspeed4*aa_;  
    defaultAngle = 0;// map(mouseX, 0, width, 0, 2);  

    rotateY(rY += (noise(nroot1 += nspeed1) - .5)*aa_*0.1);
    rotateZ(rZ += (noise(nroot2 += nspeed2) - .5) * 0.1*aa_);

    pushMatrix();  
    tabAngles[0] = aa_*10;              // wave amp
    rotateX(tabAngles[0]*aa_);
    arc(0.0, 0.0, 1, 1, 0.0, PI);
    popMatrix();

    float deltaTheta, thetaSpeed, angle;
    for (int i = 1; i < nb; i ++)
    {    
      deltaTheta = tabAngles[i-1] - tabAngles[i];
      thetaSpeed = constrain((deltaTheta + defaultAngle) * friction, -maxRot, maxRot);    
      tabAngles[i] += thetaSpeed;
    
       float C = map(i, 0, nb, 0, 1);
      color c = lerpColor(top, bottom, C);
       float stWt =  map(i, 0,nb,0.1,8 );
      
      strokeWeight(stWt);
      stroke(c,200); 
      
      angle = (noise(nroot3 + i) + .3) * PI;
      pushMatrix();
      rotateX(tabAngles[i]);
      rotateZ(noise(nroot4 + i) * PI * 30);
      arc(0.0, aa_, gap * i, gap * i, -PI/1.4, PI/1.4);//-PI/1.4, PI/1.4);
      popMatrix();
    }
  }
}
