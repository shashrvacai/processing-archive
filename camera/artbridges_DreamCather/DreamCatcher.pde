class DC {

  // color 1
  // color 2

  final int nb = 100;
  final float weight = 0.2;
  final float friction = .6;
  final float maxRot = PI ;
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

  void run(float ulx_, float uly_, float ulz_, float urx_, float ury_, float urz_, 
    float u2lx_, float u2ly_, float u2lz_, float u2rx_, float u2ry_, float u2rz_  
    ) {

    float R = map(ulx_, -1, 1, 0, 255);    
    float G = map(u2ly_, -1, 1, 0, 255);
    float B = map(ulz_, -1, 1, 0, 255);

    uly_ = map(uly_, -1, 1, 0, 1);
    u2lz_ = map(u2lz_, -1, 1, 0, 1);

    color top = color(R, G, B);
    color bottom =  color(255-G, 255-R, 255-B);

    translate(width/2, height/2);

    nroot3 += nspeed3;
    nroot4 += nspeed4*ulx_;  
    defaultAngle = 0;// map(mouseX, 0, width, 0, 2);  

    rotateY(rY+= ury_*0.05);

    rotateZ(rZ +=  0.05*urz_);

    pushMatrix();  
    tabAngles[0] = urx_*10;              // wave amp
    rotateX(tabAngles[0]*urx_);
    arc(0.0, 0.0, 1, 1, 0.0, PI);
    popMatrix();

    float deltaTheta, thetaSpeed, angle;
    for (int i = 1; i < nb; i ++)
    {    
      deltaTheta = tabAngles[i-1] - tabAngles[i];
      thetaSpeed = constrain((deltaTheta + defaultAngle) *friction, -maxRot, maxRot);    
      tabAngles[i] += thetaSpeed;

      float C = map(i, 0, nb, 0, 1);
      color c = lerpColor(top, bottom, C);
      float stWt =  map(i, 0, nb, 0.1, 4 );

      strokeWeight(stWt);
      stroke(c, 200); 

      angle = (noise(nroot3 + i) + .3) * PI;
      pushMatrix();
      rotateX(tabAngles[i]);
      rotateZ(noise(nroot2 + i) * PI * 30);
      arc(0.0, u2lx_, gap*i, gap * i, -PI/2*uly_, PI/2*u2lz_);
      popMatrix();
    }
  }
}